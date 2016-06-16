# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=retroarch-git
_gitname=RetroArch
epoch=2
pkgver=1.3.1.r2850.4feaeae
pkgrel=1
pkgdesc="Simple frontend for the Libretro API"
arch=('i686' 'x86_64' 'arm' 'armv6h')
url="http://github.com/libretro/RetroArch"
license=('GPL3')
depends=('ffmpeg' 'jack2' 'libgl' 'libusb' 'libxinerama' 'libxkbcommon'
	 'libxv' 'mesa' 'nvidia-cg-toolkit' 'openal' 'python' 'sdl2')
makedepends=('git')
provides=('retroarch')
conflicts=('retroarch')
source=("git+https://github.com/libretro/$_gitname")
sha256sums=('SKIP')

pkgver() {
  cd "$_gitname"

  printf "%s" "$(git describe --first-parent --long --tags | sed 's/v//g;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
  cd "$_gitname"

  git submodule init
  git submodule update
}

build() {
  cd "$_gitname"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$_gitname"

  make install DESTDIR="$pkgdir"
}
