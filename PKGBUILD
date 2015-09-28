# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=retroarch-git
_gitname=RetroArch
epoch=2
pkgver=1.2.2.r1464.5d9cdcd
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

  printf "%s" "$(git describe --long --tags | sed 's/v//g;s/\([^-]*-\)g/r\1/;s/-/./g')"
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
