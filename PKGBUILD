# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Marco Pompili <aur@mg.odd.red>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=freetalk
pkgver=4.2
pkgrel=1
pkgdesc="A console based Jabber client"
arch=('x86_64')
url="http://www.gnu.org/software/freetalk"
license=('GPL')
depends=('loudmouth' 'guile' 'jansson' 'curl')
source=("$pkgname-$pkgver.tar.gz::https://ftp.gnu.org/gnu/freetalk/freetalk-${pkgver}.tar.gz")
sha256sums=('bb5b4f29a706af2f891987802200e26b737bcece44338172419755f1eee1b580')

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
