# Maintainer: Blair Bonnett <blair dot bonnett @ gmail dot com>

pkgname=dust3d
pkgver=1.0.2
pkgrel=1
pkgdesc="3D watertight modeling software"
url="https://dust3d.org/"
license=('MIT')
arch=('x86_64')

depends=(
  glibc
  libgcc
  libglvnd
  libstdc++
  qt6-base
  qt6-multimedia
  qt6-svg
)
makedepends=(
  git
)

source=(
  "git+https://github.com/huxingyi/dust3d.git#tag=$pkgver"
  'cstdint.patch'
)
sha256sums=(
  '50de39b6e27f79a66b4cc3fbc6f2d48a29ba9f52225237693acec8872c762352'
  '71aa7d24f7a3ad49cf8f436e0bb2e3df689384dcd1530bf1d7ac2a450ecd2603'
)

prepare() {
  cd dust3d
  patch -p0 -i "$srcdir/cstdint.patch"
}

build() {
  cd dust3d/application
  export PATH="/usr/lib/qt6/bin/:$PATH"
  qmake
  make
}

package() {
  cd dust3d
  install -t "$pkgdir/usr/bin" -D application/dust3d
  install -t "$pkgdir/usr/share/applications" -Dm644 ci/appimage/dust3d.desktop
  install -t "$pkgdir/usr/share/pixmaps" -Dm644 ci/appimage/dust3d.png
  install -t "$pkgdir/usr/share/licenses/dust3d" -Dm644 LICENSE
}
