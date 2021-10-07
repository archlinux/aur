# Maintainer: Lukas Zimmermann <luk.zim91@gmail.com>
# Maintainer: Jonathan Herlin <jonher937+aur@gmail.com>

pkgname=terraform-provider-openstack
pkgver=1.44.0
pkgrel=1
pkgdesc="Terraform OpenStack provider"
url="https://github.com/terraform-provider-openstack/terraform-provider-openstack"
arch=("x86_64")
license=("MPL2")
makedepends=("go" "git")
_gourl="github.com/terraform-providers"
depends=('terraform')
source=("https://github.com/${pkgname}/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('28e61c053b65894dec8b0ca1371354f4bc5f0d11c17591dd4263efdb42223a55')

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

