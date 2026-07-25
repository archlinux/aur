# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=slay
pkgver=1.3.3
pkgrel=3
pkgdesc='Compile C++ code by detecting flags and includes automatically'
arch=(x86_64)
url='https://github.com/xyproto/slay'
license=(BSD-3-Clause)
makedepends=(git go)
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
b2sums=('1f7ac7dd64f5a69ec3dd2d44e0cfefad6d21f2668cdf7497cf92465d5fc9f5e348471f69238a65da7dc95d5fb1a38799dad24404f59f1fd2964e5d2d9f4fee16')

build() {
  make -C $pkgname
}

package() {
  cd $pkgname
  DESTDIR="$pkgdir" make install
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
