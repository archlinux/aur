# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=mruby
pkgver=1.2.0
pkgrel=1
pkgdesc='Lightweight Ruby'
arch=(i686 x86_64)
url='https://github.com/mruby/mruby'
license=(MIT)
depends=(readline)
makedepends=(git bison ruby)
options=(staticlibs)
source=(mruby-$pkgver.zip::https://github.com/mruby/mruby/archive/$pkgver.zip)
sha1sums=('0f3c535d6c89b710d1fd0fdbf167077abce55996')

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

  install -d "$pkgdir/usr/bin" "$pkgdir/usr/lib" "$pkgdir/usr/share/licenses/mruby"
  cp build/host/bin/* "$pkgdir/usr/bin"
  cp build/host/lib/*.a "$pkgdir/usr/lib"
  cp -r include "$pkgdir/usr"

  cp MITL "$pkgdir/usr/share/licenses/mruby/LICENSE"
}

