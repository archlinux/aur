# Maintainer: Lukas Zimmermann <luk.zim91@gmail.com>
# Maintainer: Jonathan Herlin <jonher937+aur@gmail.com>

pkgname=terraform-provider-openstack
pkgver=1.46.0
pkgrel=1
pkgdesc="Terraform OpenStack provider"
url="https://github.com/terraform-provider-openstack/terraform-provider-openstack"
arch=("x86_64")
license=("MPL2")
makedepends=("go" "git")
_gourl="github.com/terraform-providers"
depends=('terraform')
source=("https://github.com/${pkgname}/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('51fe6207ed37584b24dca72c2f71e1e21934da0894073b328920da4d13dce246')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    go mod vendor
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

