# Maintainer: ipochto <ipochto@gmail.com>

pkgname=war1gus
pkgver=3.3.2
pkgrel=1
pkgdesc="Warcraft1 Mod that allows you to play Warcraft1 with the Stratagus engine"
arch=("i686" "x86_64")
url="https://github.com/Wargus/war1gus"
license=('GPL')
makedepends=(
	'cmake'
	'imagemagick'
)
depends=(
	"stratagus=$pkgver"
	'ffmpeg' 
	'innoextract'
)
optdepends=(
	'zenity: graphical UI for data extractor'
	'xdialog: graphical UI for data extractor'
	'dialog: console UI for data extractor'
	'fluidsynth: midi music suport'
	'soundfont-fluid: sound font for midi music support'
)
conflicts=('war1gus-git')
source=("https://github.com/Wargus/$pkgname/archive/v${pkgver}.tar.gz")
md5sums=('e208a031293eb6f100e2f2982edd582c')

build() {
  cd ${srcdir}
  cmake "${pkgname}-${pkgver}" -DCMAKE_INSTALL_PREFIX=/usr -DGAMEDIR=/usr/bin -Bbuild
  make -C build
}

package()  {
  cd $srcdir/build
  make  DESTDIR=${pkgdir} install
}
