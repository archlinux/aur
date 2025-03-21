# Maintainer: Christer Solskogen <christer.solskogen@gmail.com>
# Contributor: Oliver Jaksch <arch-aur@com-in.de>
# Contributor:  John "Beelzebud" Bilbrey <beelzebud> at Geemail dot com

_pkgname=hatari
pkgname=${_pkgname}-git
pkgver=v2.5.0.264.gd635e360
pkgrel=1
pkgdesc='An Atari ST and STE emulator' 
arch=('x86_64' 'aarch64' 'armv7h')
url='https://www.hatari-emu.org/' 
license=('GPL')
depends=('sdl2' 'libpng' 'portaudio' 'systemd-libs' 'hicolor-icon-theme' 'capsimage' 'capstone')
makedepends=('cmake' 'git' 'systemd')
conflicts=('hatari')
source=("git+https://framagit.org/hatari/hatari.git")
sha256sums=('SKIP')

pkgver() {
	cd $_pkgname
	git describe --long | sed "s/\([^-]*-g\) /r\1/;s/-/./g"
}

build() {
  cd ${_pkgname}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${_pkgname}
  make DESTDIR="${pkgdir}" install
}
