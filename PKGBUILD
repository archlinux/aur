# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: Jeff Mickey <jeff@archlinux.org>
# Contributor: Torin Daniel <torindan@gmail.com>
# Contributor: Diep Pham Van <imeo@favadi.com>

pkgname=fbpanel
pkgver=7.0
pkgrel=2
pkgdesc="NetWM compliant desktop panel"
arch=('x86_64')
url="https://github.com/aanatoly/fbpanel"
depends=('gtk2')
makedepends=('python2')
license=('GPL')
source=("$pkgname-$pkgver.tar.gz::https://github.com/aanatoly/fbpanel/archive/$pkgver.tar.gz")
md5sums=('8a15ac4e0f23a72b9d6be5151df712e5')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's|python|python2|' configure .config/{repl.py,help,tar.py}
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --libexecdir /usr/lib/fbpanel --prefix /usr --mandir /usr/share/man/man1
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
