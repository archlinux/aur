# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=retroarch-git
_gitname=RetroArch
epoch=1
pkgver=1.2.2.111.g89d8b24
pkgrel=1
pkgdesc="Simple frontend for the Libretro API"
arch=('i686' 'x86_64' 'arm' 'armv6h')
url="http://github.com/libretro/RetroArch"
license=('GPL3')
depends=('ffmpeg' 'jack2' 'libgl' 'libusb' 'libxinerama' 'libxkbcommon'
	 'libxv' 'mesa' 'nvidia-cg-toolkit' 'openal' 'python' 'sdl2')
optdepends=('libretro-super-git: A collection of libretro implementations.')
makedepends=('git')
provides=('retroarch')
conflicts=('retroarch')
source=("git+https://github.com/libretro/$_gitname.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_gitname"
  local version=$(git describe --tags)
  local version=${version/v/}
  local version=${version//-/.}
  echo $version
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
