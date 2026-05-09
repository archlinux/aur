# Maintainer: Blair Bonnett <blair dot bonnett @ gmail dot com>

pkgname=dust3d
pkgver=1.0.1
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
  '96ad590e99cb66873a3ee42966044176f9796fdce5c52b5b8a8b87cd7604f337'
  '8ab39f70a629a4d1e82dfa5a4c88b9dc71bc555da4fca986a362387c7128880e'
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
