# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Bartosz Slawianowski <me2.legion at gmail dot com>

_basename=ffmpegthumbs
pkgname="${_basename}-git"
pkgver=24.01.90.r4.g5cdd8fa
pkgrel=1
pkgdesc='KDE Thumbnailer based on FFmpeg (git build)'
arch=(x86_64)
url="https://invent.kde.org/multimedia/${_basename}"
license=(GPL-2.0-or-later)
depends=(ffmpeg
         gcc-libs
         glibc
         kconfig
         kcoreaddons
         kio
         qt6-base)
makedepends=(extra-cmake-modules-git
             git)
provides=("${_basename}=${pkgver%.r*}")
conflicts=("${_basename}")
source=("git+${url}.git")
b2sums=('SKIP')

pkgver() {
  cd "${_basename}"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S "${_basename}" \
    -DBUILD_TESTING=OFF \
    -DQT_MAJOR_VERSION=6
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

