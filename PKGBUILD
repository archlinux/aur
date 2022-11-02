# Maintainer: bgme <i@bgme.me>
# Contributor: ml <>

_pkgname=probe-cli
pkgname=ooniprobe-cli
pkgver=3.16.5
pkgrel=1
pkgdesc='Next generation OONI Probe CLI'
arch=('x86_64')
url='https://ooni.org/'
license=('GPL3')
depends=('glibc')
makedepends=('go')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/ooni/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('198f7a3507482bfbf0fb24c24f34e17c9f5adbfdf5d8c63774ecd816708a4438')
sha512sums=('aba77ec9597ff28312918779dfe58ebb10915c609b52ab23266c73a30c3bf1804117339be16b5bc1246890fc9d84ea49ce2216ac03f19f19da1ab6ea728cdb25')

build() {
  cd "${_pkgname}-${pkgver}"
  export CGO_ENABLED=1
  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export GOFLAGS='-ldflags=-linkmode=external -buildmode=pie -trimpath -modcacherw'
  go build ./cmd/ooniprobe
}

package() {
  cd "${_pkgname}-${pkgver}"
  install -Dm755 ooniprobe -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 Readme.md -t "$pkgdir/usr/share/doc/$pkgname"
}
