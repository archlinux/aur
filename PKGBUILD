# Maintainer: pupu <li+puoopuo0o at nand dot sh>

pkgname=fcitx5-cskk
pkgver=1.2.0
pkgrel=1
pkgdesc="SKK input method plugin for fcitx5 that uses LibCSKK"
arch=('x86_64')
url="https://github.com/fcitx/fcitx5-cskk"
license=('GPL-3.0-or-later')
depends=(
  cskk
  fcitx5-qt
)
makedepends=(
  cmake
  extra-cmake-modules
)
optdepends=('skk-jisyo: dictionary files')
source=(
  "$pkgname-v$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
  "StandardPaths.patch::https://github.com/freebsd/freebsd-ports/raw/9ddf0ebfddcbcbde1a12fcc1daaccf29e4fc1761/japanese/fcitx5-cskk/files/patch-api"
)
b2sums=(
  'd5ec4fea62ad2e1d1d95f5b71bf9d466afbeb4e8d22b841c5e5b9fa51aa32ae23de47fcb853db2a7c4b99e308ce0ef62775ac6449e45dd2eaebf184bb5a83c3f'
  '24fdf4eceb6641055db90c6ac2f83998aaacb4b1cfbef5ab9422e6d7ddc613afa836e38258f71015cca5ce3d9e0ead888056f28c4be5d7fb8276d7a316f340d3'
)

prepare() {
  patch -Np0 -d"$pkgname-$pkgver" <StandardPaths.patch
}

build() {
  cmake \
    -S"$pkgname-$pkgver" \
    -Bbuild \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
