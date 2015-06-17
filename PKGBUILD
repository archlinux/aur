# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=mruby
pkgver=1.1.0
pkgrel=1
pkgdesc='Lightweight Ruby'
arch=(i686 x86_64)
url='https://github.com/mruby/mruby'
license=(MIT)
makedepends=(git bison ruby)
options=(staticlibs)
source=(https://github.com/mruby/mruby/archive/$pkgver.zip
        remove_termcap_static_lib.patch)
sha1sums=('SKIP'
          '3042fc7811afee7e88535dca43495a1a5486d6a5')

prepare() {
  cd mruby-$pkgver
  patch -p1 < "$srcdir"/remove_termcap_static_lib.patch
}

build() {
  cd mruby-$pkgver
  CFLAGS="$CFLAGS -std=c11"
  make
}

check() {
  cd mruby-$pkgver
  make test
}

package() {
  cd mruby-$pkgver

  install -d "$pkgdir/usr/bin" "$pkgdir/usr/lib"
  cp build/host/bin/* "$pkgdir/usr/bin"
  cp build/host/lib/*.a "$pkgdir/usr/lib"
  cp -r include "$pkgdir/usr"
}

