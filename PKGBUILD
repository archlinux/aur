# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=slay
pkgver=1.3.9
pkgrel=1
pkgdesc='Compile C++ code by detecting flags and includes automatically'
arch=(x86_64)
url='https://github.com/xyproto/slay'
license=(BSD-3-Clause)
makedepends=(git go)
provides=(cxx)
replaces=(cxx)
optdepends=('ccache: For faster builds'
            'clang: For clang-format and for clang++'
            'gprof2dot: For visualizing profiling information'
            'graphviz: For visualizing profiling information'
            'kcachegrind: For visualizing profiling information'
            'lldb: For debugging'
            'mingw-w64-gcc: For compiling 64-bit Windows executables'
            'valgrind: For tracing calls and profiling'
            'wine: For running 64-bit Windows exectuables')
source=("git+$url#tag=v$pkgver")
b2sums=('b4cfe4293167904db4ff7f6621fcc813066fdcdfcbe1bb988c8677869a6e28d0bb64f2951cc55478db86e7474645dbb45387ac4d9f1110379c2583f59ba394ec')

build() {
  make -C $pkgname
}

package() {
  cd $pkgname
  DESTDIR="$pkgdir" make install
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  ln -s /usr/bin/slay "$pkgdir/usr/bin/cxx"
}
