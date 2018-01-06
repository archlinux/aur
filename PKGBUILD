# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=freetalk
pkgver=4.1
pkgrel=4
pkgdesc="A console based Jabber client"
arch=('x86_64')
url="http://www.gnu.org/software/freetalk"
license=('GPL')
depends=('loudmouth' 'guile2.0' 'jansson' 'curl')
source=("$pkgname-$pkgver.tar.gz::https://github.com/GNUFreetalk/freetalk/archive/v$pkgver.tar.gz")
md5sums=('3141e633e83b12083e5c0e49bbc9d150')

build() {
  cd $pkgname-$pkgver
  [ -x configure ] || ./autogen.sh
  ./configure --prefix=/usr --disable-rpath
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  rm "$pkgdir/usr/share/info/dir"
}
