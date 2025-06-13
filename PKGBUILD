# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: redfish <redfish@galactica.pw>
# Contributor: Gergely Imreh <imrehg@gmailcom>
# Contributor: Jakub "Kubuxu" Sztandera  <kubuxu@protonmail.ch>

pkgname=ipget
pkgver=0.11.2
pkgrel=1
pkgdesc="wget for IPFS: retrieve files over IPFS and save them locally"
arch=('x86_64')
url="https://github.com/ipfs/ipget"
license=('MIT')
depends=('glibc')
makedepends=('go')
optdepends=('go-ipfs: to use full potential of IPFS network')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('6c929d5ba324d9e0eeccf3e22ff0caa359e9937e3abdfda283caffe3fda5e2dc')

build() {
  cd "${pkgname}-${pkgver}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 -t "${pkgdir}/usr/bin" ipget
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}

# vim: set expandtab ts=2 sw=2:
