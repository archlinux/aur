# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Mateen Ulhaq <mulhaq2005+aur at gmail dot com>

pkgname=mpeg-pcc-tmc13-git
pkgver=14.0.r0.gc3c9798
pkgrel=1
pkgdesc="Geometry based point cloud compression (G-PCC) test model"
arch=("x86_64")
url="https://github.com/MPEGGroup/mpeg-pcc-tmc13.git"
license=("BSD")
depends=("gcc-libs")
makedepends=("git" "gcc" "make" "cmake")
provides=("mpeg-pcc-tmc13")
conflicts=("mpeg-pcc-tmc13")
source=("$pkgname::git+https://github.com/MPEGGroup/mpeg-pcc-tmc13")
sha256sums=("SKIP")

pkgver() {
  cd "$pkgname" || exit 1
  git describe --long --tags | sed 's/^release-v//; s/\([^-]*-g\)/r\1/; s/-/./g'
}

build() {
  cd "$pkgname" || exit 1
  mkdir -p build
  cd build || exit 1
  cmake ..
  make
}

package() {
  cd "$pkgname" || exit 1
  install -Dm755 "build/tmc3/tmc3" "$pkgdir/usr/bin/tmc3"
  install -Dm644 "COPYING" "$pkgdir/usr/share/licenses/mpeg-pcc-tmc13/COPYING"
  mkdir -p "$pkgdir/usr/share/doc/mpeg-pcc-tmc13/"
  install -Dm644 \
    README*.md \
    doc/README*.md \
    "$pkgdir/usr/share/doc/mpeg-pcc-tmc13/"
}
