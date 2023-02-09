# Maintainer: Piotr Górski <lucjan.lucjanov@gmail.com>

pkgname=esdm-git
_pkgname=esdm
pkgver=0.6.0.r188.gbfb31be
pkgrel=1
pkgdesc="Entropy Source and DRNG Manager"
url="https://github.com/smuellerDD/esdm"
license=(GPL3)
arch=(x86_64)
depends=('protobuf-c' 'jitterentropy' 'libselinux' 'fuse3')
makedepends=('meson' 'git')
conflicts=('esdm')
provides=("esdm=${pkgver}")
source=('git+https://github.com/smuellerDD/esdm')
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  _ver="$(cat meson.build | grep -m1 version: | grep -o "[[:digit:]]*" | paste -sd'.')"
  printf "${_ver}.r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cd $_pkgname
  arch-meson . build
  meson compile -C build
}

package() {
  cd $_pkgname
  meson install -C build --destdir "${pkgdir}"
}
