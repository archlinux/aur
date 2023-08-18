# Maintainer: 7Ji <pugokushin@gmail.com>

_pkgname='libv4l-rkmpp'
pkgname="${_pkgname}-git"
pkgver=1.5.1.r5.38da407
pkgrel=1
pkgdesc='A rockchip-mpp V4L2 wrapper plugin for chromium V4L2 VDA/VEA, latest from git'
url='https://github.com/JeffyCN/libv4l-rkmpp'
license=('LGPL2.1')
source=(git+https://github.com/JeffyCN/libv4l-rkmpp)
cksums=('SKIP')
arch=('aarch64')
depends=('v4l-utils-mpp' 'librga-multi' 'mpp-git')
makedepends=('meson')
conflicts=("${_pkgname}")
provides=("${_pkgname}=${pkgver}")

_srcname="${_pkgname}"

pkgver() {
  cd "${_srcname}"
  printf "%s" "$(git describe --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  arch-meson "${_srcname}" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
}