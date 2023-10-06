# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=libcutl
pkgver=1.11.0
_xsdver=4.2
pkgrel=3
pkgdesc='A C++ utility library'
arch=(x86_64)
url='https://www.codesynthesis.com/projects/libcutl/'
license=(MIT)
makedepends=(build2)
depends=(gcc-libs
         glibc)
source=(https://www.codesynthesis.com/download/xsd/$_xsdver/$pkgname-$pkgver.tar.gz)
sha256sums=('bb78ff87d6cb1a2544543ffe7941f0aeb8f9dcaf7dd46e9acef3e032ed7881dc')

build() {
  bpkg create -d build cc          \
    config.cxx=g++                 \
    config.cc.coptions="${CXXFLAGS} ${LDFLAGS}"
  cd build
  bpkg add "$srcdir"/$pkgname-$pkgver --type dir
  bpkg rep-fetch
  bpkg build libcutl
}

package() {
  cd build
  bpkg install config.install.root="$pkgdir"/usr libcutl
  rm "$pkgdir"/usr/lib/pkgconfig/libcutl.static.pc

  install -Dm644 "$srcdir"/$pkgname-$pkgver/LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
