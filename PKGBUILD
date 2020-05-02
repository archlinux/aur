# Maintainer: Lukas Zimmermann <luk.zim91@gmail.com>
# Maintainer: Jonathan Herlin <jonher937+aur@gmail.com>

pkgname=terraform-provider-openstack
pkgver=1.27.0
pkgrel=1
pkgdesc="Terraform OpenStack provider"
url="https://github.com/terraform-providers/terraform-provider-openstack"
arch=("x86_64")
license=("MPL2")
makedepends=("go-pie" "git")
_gourl="github.com/terraform-providers"
depends=('terraform')
source=("https://github.com/terraform-providers/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('4c06de15838a93ca48c33e3e484229310a470241fe3c0da454960aa93e605424')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    go build -buildmode=pie -a -trimpath -mod=vendor -o "${pkgname}" . 
}

check() {
  cd "${pkgname}-${pkgver}"
  go test -mod=vendor ./...
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

