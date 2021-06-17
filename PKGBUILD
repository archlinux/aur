# Maintainer: Chris Howey <chris@howey.me> -> also the program developer

pkgname=ledger-go
_pkgname=${pkgname%-go}
pkgver=0.3.2
pkgrel=1
pkgdesc="A double-entry accounting system with a command-line reporting interface"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://github.com/howeyc/ledger"
license=(ISC)
depends=(glibc)
makedepends=(go)
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('3deb9817e39707de13498d51ad6cd416724a723824c523f098c6360c4732f591')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  CGO_ENABLED=0

  go build \
	-o ledger-go \
    -trimpath \
    -buildmode=pie \
    ./ledger
}

package() {
  install -Dm755 "${srcdir}"/${_pkgname}-${pkgver}/ledger-go "${pkgdir}"/usr/bin/ledger
  install -Dm644 "${srcdir}"/${_pkgname}-${pkgver}/LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
