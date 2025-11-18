# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Sven Hesse <drmccoy@drmccoy.de>

pkgname=xoreos-git
pkgver=0.0.6.r235.gf36b681
pkgrel=1
pkgdesc="A reimplementation of BioWare's Aurora engine"
arch=(x86_64)
url="https://github.com/xoreos/xoreos"
license=(GPL-3.0-or-later)
depends=(glibc gcc-libs zlib xz libxml2 boost-libs sdl2 freetype2 openal libmad libglvnd libvorbis faad2 xvidcore libvpx) #libogg
makedepends=(git boost)
provides=(xoreos)
conflicts=(xoreos)
source=("git+https://github.com/xoreos/xoreos.git")
sha256sums=('SKIP')

pkgver() {
  cd xoreos
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd xoreos
  ./autogen.sh
}

build() {
  cd xoreos
  ./configure --with-release=AUR --with-lto --prefix=/usr
  make
}

package() {
  cd xoreos
  make DESTDIR="$pkgdir/" install
}
