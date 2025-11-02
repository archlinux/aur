# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: redfish <redfish@galactica.pw>
# Contributor: Gergely Imreh <imrehg@gmailcom>
# Contributor: Jakub "Kubuxu" Sztandera <kubuxu@protonmail.ch>

pkgname=ipget
pkgver=0.12.1
pkgrel=1
pkgdesc="wget for IPFS: retrieve files over IPFS and save them locally"
arch=('x86_64')
url="https://github.com/ipfs/ipget"
license=('MIT')
depends=('glibc')
makedepends=('go')
optdepends=('go-ipfs: to use full potential of IPFS network')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('4a5016260d5a2be0f0599534f6faaaa3026131c4c13ef0ca30644d39a8ab9103')

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
