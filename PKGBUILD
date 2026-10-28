# Maintainer: Christer Solskogen <christer.solskogen@gmail.com>
# Contributor: Oliver Jaksch <arch-aur@com-in.de>
# Contributor:  John "Beelzebud" Bilbrey <beelzebud> at Geemail dot com

_pkgname=hatari
pkgname=${_pkgname}-git
pkgver=v2.6.1.592.g23bc3060
pkgrel=1
pkgdesc='An Atari ST and STE emulator' 
arch=('x86_64' 'aarch64' 'armv7h')
url='https://www.hatari-emu.org/' 
license=('GPL-2.0-or-later')
depends=(
  'glibc'
  'hicolor-icon-theme'
  'sdl2'
  'libpng'
  'libx11'
  'portmidi'
  'readline'
  'systemd-libs'
  'zlib'
)
makedepends=('cmake' 'git' 'systemd')
conflicts=('hatari')
source=("git+https://framagit.org/hatari/hatari.git")
sha256sums=('SKIP')
optdepends=(
  'python: for atari-convert-dir'
  'sh: for atari-hd-image, zip2st, hatari-prg-args'
)

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
