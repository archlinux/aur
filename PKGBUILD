# Maintainer: Joey Dumont <joey.dumont@gmail.com>
# Contributor Dominik Pieczyński <dominik.pieczynski@gmail.com>
# Contributor: Alex Mason <alex@judgementstudios.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=castawesome
pkgver=0.15.1
pkgrel=3
arch=('any')
pkgdesc='A GUI frontend for ffmpeg livestreaming'
url='http://sourceforge.net/projects/castawesome/'
license=('GPL3')
depends=('ffmpeg' 'gtk3' 'python2' 'python2-gobject')
source=(https://github.com/TheSamsai/Castawesome/releases/download/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('65466f03a9981976bb7cbfc8f8c66384b12b2a2aaef7024a3356b43d9d7f33ca')

prepare() {
  cd $pkgname

  sed -i 's#cp castawesome.py#install -Dm 755 castawesome.py#' Makefile
  sed -i 's#/usr/local#$(DESTDIR)/usr#g' Makefile
  sed -i 's#/usr/local#/usr#' castawesome.py
  sed -i 's#/usr/local#/usr#' uninstall_castawesome.sh
}

build() {
  cd $pkgname
  make
}

package() {
  cd $pkgname

  install -dm 755 "$pkgdir/usr/share/castawesome"
  make DESTDIR="$pkgdir" install

  rm -rf "$pkgdir/usr/share/applications"
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
