# Maintainer: Lukas Zimmermann <luk.zim91@gmail.com>
# Maintainer: Jonathan Herlin <jonher937+aur@gmail.com>

pkgname=terraform-provider-openstack
pkgver=1.30.0
pkgrel=1
pkgdesc="Terraform OpenStack provider"
url="https://github.com/terraform-providers/terraform-provider-openstack"
arch=("x86_64")
license=("MPL2")
makedepends=("go-pie" "git")
_gourl="github.com/terraform-providers"
depends=('terraform')
source=("https://github.com/terraform-providers/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('8892f193184aa05ba1b44965bc3a3f8ca236ded842395006ea0c5c97d1f2faf2')

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

