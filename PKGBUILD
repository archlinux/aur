# Maintainer: Prurigro

pkgname=fractalnow
pkgver=0.8.2
pkgrel=1
pkgdesc='Provides users with tools to generate pictures of various types of fractals quickly and easily'
url='http://sourceforge.net/projects/fractalnow'
license=('LGPL3')
depends=('qt5-base' 'libmpc')
arch=('i686' 'x86_64')
source=("http://downloads.sourceforge.net/project/fractalnow/FractalNow/$pkgver/sources/$pkgname-$pkgver.tar.gz")
sha512sums=('e5b9154c59a13777d46baf57b2b0b8cc86e1124066f6f204c0445b0c46fa94259fe77bc8844c026423c859b6b25d765f8a4180d96f045637bb0311e7b01fb86b')
install=$pkgname.install

build() {
  cd $pkgname-$pkgver
  ./configure -prefix /usr
  make
}

package() {
  cd $pkgname-$pkgver
  ESCPKGDIR=$(sed "s/\//\\\\\//g;s/\ /\\\\ /g" <<< "$pkgdir")
  sed -i -e "s/PREFIX\ =\ \/usr"/"PREFIX\ =\ ${ESCPKGDIR}\/usr/g" Makefile
  make install
}
