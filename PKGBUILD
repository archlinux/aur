# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>
# Contributor: Aaron Lindsay <aaron@aaronlindsay.com>
# Contributor: Tiago Camargo <tcamargo@gmail.com>

pkgname=libfat-ogc
pkgver=1.0.11
pkgrel=1
pkgdesc="Library for acessing FAT filesystems from Nintendo Gamecube/Wii homebrew"
arch=('any')
url="http://www.devkitpro.org/"
license=('custom')
options=(!strip staticlibs)
depends=('devkitppc' 'libogc')
conflicts=('libfat-ogc-svn') # this is a hack to support transition, can be removed later
source=("http://downloads.sourceforge.net/sourceforge/devkitpro/libfat-src-$pkgver.tar.bz2")
sha256sums=('ded1a18f4b3baea1fdba3868fd79cf0189c57f3697099b9ea4727cbd1a519ae0')

build() {
  source /etc/profile.d/devkitppc.sh

  make ogc-release
}

package() {
  export DEVKITPRO="$pkgdir"/opt/devkitpro

  install -d "$DEVKITPRO"/libogc/{lib/{cube,wii},include}
  make ogc-install
  # license
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  head -n 30 include/fat.h > "$pkgdir"/usr/share/licenses/$pkgname/license.txt
}
