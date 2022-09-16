# Maintainer: so1ar <so1ar114514@gmail.com>

pkgname=rime-opencc-emoji-symbols-git
pkgver=20220315.r43.627dc7e
pkgrel=4
pkgdesc="Rime 输入法 Emoji 与符号滤镜"
arch=('any')
url="https://github.com/rtransformation/rime-opencc_emoji_symbols"
license=('MIT')
# dependency for reverse lookup
depends=('librime' 'rime-prelude')
provides=('rime-opencc-emoji-symbols')
conflicts=('rime-opencc-emoji-symbols')
source=("rime-opencc_emoji_symbols::git+https://github.com/rtransformation/rime-opencc_emoji_symbols.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir"/rime-opencc_emoji_symbols
    local date=$(git log -1 --format="%cd" --date=short | sed s/-//g)
    local count=$(git rev-list --count HEAD)
    local commit=$(git rev-parse --short HEAD)
    echo "$date.r${count}.$commit"
}

package() {
  cd rime-opencc_emoji_symbols
  install -Dm644 es.{json,txt} -t "$pkgdir"/usr/share/rime-data/opencc/
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/rime-opencc-emoji-symbols/
}
