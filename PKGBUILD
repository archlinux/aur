# Maintainer: ipochto <ipochto@gmail.com>
# Contributor: Thaodan <theodorstormgrade@gmail.com>

pkgname=wargus
pkgver=3.3.1
pkgrel=1
pkgdesc="Warcraft2 Mod that allows you to play Warcraft2 with the Stratagus engine"
arch=("i686" "x86_64")
url="https://github.com/wargus/wargus"
license=('GPL')
makedepends=('cmake')
depends=(
	"stratagus=$pkgver"
	'ffmpeg2theora'
	'cdparanoia'
	'timidity++'
)
optdepends=(
	'zenity: graphical UI for data extractor'
	'xdialog: graphical UI for data extractor'
	'dialog: console UI for data extractor'
	'fluidsynth: midi music support'
	'soundfont-fluid: sound font for midi music support'
)
source=("https://github.com/Wargus/$pkgname/archive/v${pkgver}.tar.gz")
md5sums=('bf45f3cb353b6051413f81feecf34fc3')

build() {
  cd ${srcdir}
  cmake "${pkgname}-${pkgver}" -DCMAKE_INSTALL_PREFIX=/usr -DGAMEDIR=/usr/bin -Bbuild
  make -C build
}

package()  {
  cd $srcdir/build
  make  DESTDIR=${pkgdir} install
}
