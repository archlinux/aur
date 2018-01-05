# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Dag Odenhall <dag.odenhall@gmail.com>

pkgname=swarp
pkgver=0.1
pkgrel=4
pkgdesc="Simple pointer warp"
license=('MIT')
arch=(x86_64)
url="http://tools.suckless.org/"
depends=(glibc libx11)
source=(http://dl.suckless.org/tools/swarp-$pkgver.tar.gz
	config.mk)
md5sums=('b674dd2f33c45cbd789e4b6e09b7b55e'
         '6fccb02af362a7284df689eea053a154')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  cp "$srcdir"/config.mk .
  sed -i "s/%VERSION%/$pkgver/g" config.mk
  sed -i "s/%CFLAGS%/$CFLAGS/g" config.mk
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -m644 -D LICENSE "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
