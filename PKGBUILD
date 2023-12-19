# Maintainer: Piotr Górski <lucjan.lucjanov@gmail.com>

pkgname=esdm-git
_pkgname=esdm
pkgver=1.0.1.r4.g346953a
pkgrel=1
pkgdesc="Entropy Source and DRNG Manager"
url="https://github.com/smuellerDD/esdm"
license=('GPL2' 'BSD')
arch=('x86_64')
depends=('protobuf-c' 'jitterentropy' 'libselinux' 'fuse3')
makedepends=('meson' 'git')
conflicts=('esdm')
provides=('esdm')
source=('git+https://github.com/smuellerDD/esdm')
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
