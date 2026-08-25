# Maintainer: KFERMercer <https://github.com/KFERMercer> 

# shellcheck disable=2034,2148,2154,2164

pkgname=riipl-git
pkgver=r78.81c7d93
pkgrel=1
pkgdesc="Local DeepL rip-off powered by any OpenAI-compatible API"
arch=(x86_64 aarch64)
url="https://github.com/KFERMercer/RiipL"
license=('GPL-3.0-only')
depends=(qt6-base hicolor-icon-theme)
makedepends=(git cmake qt6-tools)
provides=(riipl)
conflicts=(riipl)
source=("$pkgname::git+https://github.com/KFERMercer/RiipL.git"
        "riipl.desktop")
sha256sums=('SKIP'
            '97f09da0bc6ebf851c55f391e2e3ecba1040a2a18ceab2c8264c4c1b4998ef99')

pkgver() {
  cd "$pkgname"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cmake -S "$pkgname" -B build -DCMAKE_BUILD_TYPE=None
  cmake --build build
}

package() {
  install -Dm755 build/RiipL "$pkgdir/usr/bin/riipl"
  install -Dm644 "$pkgname/resources/icons/app.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/riipl.svg"
  install -Dm644 riipl.desktop -t "$pkgdir/usr/share/applications/"
  install -Dm644 "$pkgname/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
