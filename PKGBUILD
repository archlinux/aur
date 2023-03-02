# Maintainer: bgme <i@bgme.me>
# Contributor: ml <>

_pkgname=probe-cli
pkgname=ooniprobe-cli
pkgver=3.17.0
_pkgver=3.17.0
pkgrel=1
pkgdesc='Next generation OONI Probe CLI'
arch=('x86_64')
url='https://ooni.org/'
license=('GPL3')
depends=('glibc')
makedepends=('go1.19')
source=("${_pkgname}-${_pkgver}.tar.gz::https://github.com/ooni/${_pkgname}/archive/refs/tags/v${_pkgver}.tar.gz")
sha256sums=('b5de405f6ca6c0a0d8f630274efac7f24f54890c5571ce1f6a42849d6fa8854e')
sha512sums=('c35302ca4db0355830b41fac5d34e1791d5e788f4c757d06f640cf304578a0fe65d89675996d15c99a0f8f258dc4b508862964639a53b75e8328a13465bd5126')

build() {
  cd "${_pkgname}-${_pkgver}"
  export CGO_ENABLED=1
  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export GOFLAGS='-ldflags=-linkmode=external -buildmode=pie -trimpath -modcacherw'
  go1.19 build ./cmd/ooniprobe
}

package() {
  cd "${_pkgname}-${pkgver}"
  install -Dm755 ooniprobe -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 Readme.md -t "$pkgdir/usr/share/doc/$pkgname"
}
