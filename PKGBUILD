# Maintainer: Julian Xhokaxhiu    <info at julianxhokaxhiu dot com>
# Contributor: almostalive   <almostalive2003 at gmail dot com>
# Contributor: Themaister    <maister@archlinux.us>

pkgname=retroarch-rbp-git
pkgver=1.2.1.3640.g6c7da0e
pkgrel=1
pkgdesc="Reference frontend for the libretro API."
arch=('arm' 'armv6h' 'armv7h')
url="http://github.com/libretro/RetroArch"
license=('GPL')
depends=('mesa' 'mesa-libgl' 'libusb' 'openal' 'python' 'sdl2')
makedepends=('git')
provides=('retroarch' 'retroarch-git')
conflicts=('retroarch')

_gitname=RetroArch
source=("git+https://github.com/libretro/${_gitname}.git")
md5sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  local version=$(git describe --tags)
  local version=${version/v/}
  local version=${version//-/.}
  echo $version
}

build() {
  cd "${_gitname}"
  ./configure --prefix=/usr --enable-neon --enable-dispmanx --enable-floathard --enable-udev
  make
}

package() {
  cd "${_gitname}"
  make install DESTDIR="${pkgdir}"
}
