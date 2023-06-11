# Maintainer: bgme <i@bgme.me>
# Contributor: ml <>

_pkgname=probe-cli
pkgname=ooniprobe-cli
pkgver=3.17.5
_pkgver=3.17.5
pkgrel=1
pkgdesc='Next generation OONI Probe CLI'
arch=('x86_64')
url='https://ooni.org/'
license=('GPL3')
depends=('glibc')
makedepends=('go1.19')
source=("${_pkgname}-${_pkgver}.tar.gz::https://github.com/ooni/${_pkgname}/archive/refs/tags/v${_pkgver}.tar.gz")
sha256sums=('6e0f7c1fb725943c74dacc799389ebe8d042238cde32b3d5b8f1dbfa04b10880')
sha512sums=('685c21d433cbc9b0381a376936e31a8bedcd68753cc2be6d7c32a7ccd1506a6d6d023a240459c9614cbb0ce56815b224dc6581116325781e0fecb991583a0e7c')

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
