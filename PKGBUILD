# Maintainer: KFERMercer <https://github.com/KFERMercer>

# shellcheck disable=2034,2148,2154,2164

_srcname=RiipL

pkgname=riipl
pkgver=1.0
pkgrel=1
pkgdesc="Lightning-fast, all-in-one desktop translator"
arch=(x86_64 aarch64)
url="https://github.com/KFERMercer/RiipL"
license=('GPL-3.0-only')
depends=(hicolor-icon-theme qt6-base qt6-svg)
makedepends=(cmake qt6-tools)
conflicts=(riipl-git)
source=("$_srcname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('eaa5eeb399d2c671ed3992f044f51fe2bfd745ba95fa5aa0edc70aa73a281c7d')

build() {
  cmake -S "$_srcname-$pkgver" -B build -DCMAKE_BUILD_TYPE=None
  cmake --build build
}

package() {
  install -Dm755 build/riipl "$pkgdir/usr/bin/riipl"
  install -Dm644 "$_srcname-$pkgver/resources/icons/app.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/riipl.svg"
  install -Dm644 "$_srcname-$pkgver/resources/riipl.desktop" -t "$pkgdir/usr/share/applications/"
  install -Dm644 "$_srcname-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
