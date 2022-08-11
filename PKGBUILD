# Maintainer: ipochto <ipochto@gmail.com>

pkgname=war1gus-git
pkgver=3.3.2.r1233.c2a6013_20220811
pkgrel=1
pkgdesc="Warcraft1 Mod that allows you to play Warcraft1 with the Stratagus engine (dev version)"
arch=("i686" "x86_64")
url="https://github.com/Wargus/war1gus"
license=('GPL')
makedepends=(
	'git' 
	'cmake' 
	'imagemagick'
)
depends=(
	'stratagus-git' 
	'ffmpeg' 
	'innoextract'
)
optdepends=(
	'zenity: graphical UI for data extractor'
	'xdialog: graphical UI for data extractor'
	'dialog: console UI for data extractor'
	'fluidsynth: midi music support'
	'soundfont-fluid: sound font for midi music support'
)
conflicts=('war1gus')
source=("${pkgname}::git+https://github.com/Wargus/war1gus.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname}"
	dev_cycle=3.3.2
	printf "%s.r%s.%s_%s" "${dev_cycle}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" "$(date +%Y%m%d)"
}

build() {
  cd ${srcdir}
  cmake ${pkgname} -DCMAKE_INSTALL_PREFIX=/usr -DGAMEDIR=/usr/bin -Bbuild
  make -C build
}

package()  {
  cd $srcdir/build
  make  DESTDIR=${pkgdir} install
}
