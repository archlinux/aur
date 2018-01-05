# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Jacek Poplawski <jacekpoplawski@gmail.com>

pkgname=gtkballs
pkgver=3.1.5
pkgrel=6
pkgdesc="clone of Lines - logic game about balls"
arch=('x86_64')
url="http://gtkballs.antex.ru/"
license=('GPL')
depends=("gtk2")
backup=(var/games/gtkballs/gtkballs-scores)
source=(http://gtkballs.antex.ru/dist/gtkballs-$pkgver.tar.gz)
md5sums=('1654799db1e9a46607b06f7ad3c0bf05')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  ./configure --prefix=/usr \
              --localstatedir=/var/games/gtkballs \
              --mandir=/usr/share/man
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  make install DESTDIR="$pkgdir"
  chown -R root:games "$pkgdir"/var/games/gtkballs/
  chmod -R ug+w "$pkgdir"/var/games/gtkballs/
}
