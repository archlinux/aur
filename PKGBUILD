#Maintainer: Frederic Bezies <fredbezies at gmail dot com>
#Contributor: Oliver Jaksch <arch-aur@com-in.de>
#Contributor: John "Beelzebud" Bilbrey <beelzebud> at Geemail dot com

pkgname=hatari-enhanced-git
realpkgname=hatari
pkgver=v2.6.1.r446.gd3f0ad7
pkgrel=1
pkgdesc='An Atari ST and STE emulator. This build uses capsimage for using IPF and STX disk images.'
arch=('x86_64')
url='http://hatari.sourceforge.net/'
license=('GPL-2.0-or-later')
depends=('sdl3' 'libpng' 'systemd-libs' 'hicolor-icon-theme' 'capstone' 'capsimage' 'python' 'libarchive')
makedepends=('cmake' 'git' 'systemd')
conflicts=('hatari')
source=("git+https://framagit.org/hatari/hatari.git")
sha256sums=('SKIP')

pkgver() {
	cd "$realpkgname"
	git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${realpkgname}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${realpkgname}
  make DESTDIR="${pkgdir}" install
}
