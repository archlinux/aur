# Maintainer: N McClellan <nsmcclellan at gmail dot com>
pkgname=egl-wayland2-git
_pkgname=egl-wayland2
pkgver=v1.0.0.rc.r47.g3e5b643
pkgrel=1
pkgdesc="Wayland EGL External Platform library, Version 2 (git version)"
arch=('x86_64')
url="https://github.com/NVIDIA/egl-wayland2"
license=('Apache-2.0')
depends=('wayland' 'wayland-protocols' 'egl-gbm')
makedepends=('git' 'meson')
provides=('egl-wayland2')
conflicts=('egl-wayland2') # Once a stable version exists...
source=("git+https://github.com/NVIDIA/egl-wayland2.git")
sha256sums=('SKIP')
options=('!debug')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  mkdir build
  meson setup --prefix=/usr --buildtype=plain build
  ninja -C build
}

package() {
  cd "$_pkgname"
  DESTDIR="$pkgdir" ninja -C build install
}
