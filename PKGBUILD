# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=slay
pkgver=1.3.4
pkgrel=2
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
b2sums=('16c15bc1d37804bfd0d956ef1ffe6abac89f22b4a031eb6d9d9a6ee492a3bc150d070ae021dbc7069a24a42fb8ced46abbe35ebc65c7e0c24a8d2c5d6161ac40')

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
