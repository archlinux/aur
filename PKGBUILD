# Maintainer: KFERMercer <https://github.com/KFERMercer>

# shellcheck disable=2034,2148,2154,2164

_srcname=RiipL

pkgname=riipl
pkgver=0.2
pkgrel=1
pkgdesc="Local DeepL rip-off powered by any OpenAI-compatible API"
arch=(x86_64 aarch64)
url="https://github.com/KFERMercer/RiipL"
license=('GPL-3.0-only')
depends=(qt6-base hicolor-icon-theme)
makedepends=(cmake qt6-tools)
conflicts=(riipl-git)
source=("$_srcname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
        "riipl.desktop")
sha256sums=('abc1c2ec4849b429b9bc01d978e1130fdd9e156702c7bfd35fe185c89a1b07d0'
            '97f09da0bc6ebf851c55f391e2e3ecba1040a2a18ceab2c8264c4c1b4998ef99')

build() {
  cmake -S "$_srcname-$pkgver" -B build -DCMAKE_BUILD_TYPE=None
  cmake --build build
}

package() {
  install -Dm755 build/RiipL "$pkgdir/usr/bin/riipl"
  install -Dm644 "$_srcname-$pkgver/resources/icons/app.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/riipl.svg"
  install -Dm644 riipl.desktop -t "$pkgdir/usr/share/applications/"
  install -Dm644 "$_srcname-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
