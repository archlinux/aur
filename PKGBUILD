# Maintainer: so1ar <so1ar114514@gmail.com>

pkgname=rime-opencc-emoji-symbols-git
pkgver=20220315.r43.627dc7e
pkgrel=1
pkgdesc="Rime 输入法 Emoji 与符号滤镜"
arch=('any')
url="https://github.com/rtransformation/rime-opencc_emoji_symbols"
license=('MIT')
# dependency for reverse lookup
depends=('librime' 'rime-prelude')
provides=('rime-opencc-emoji-symbols')
conflicts=('rime-opencc-emoji-symbols')
source=("rime-opencc_emoji_symbols::git+https://github.com/rtransformation/rime-opencc_emoji_symbols.git"
	"https://raw.githubusercontent.com/so1ar/rime-cloverpinyin/main/src/es_modify.patch")
sha256sums=('SKIP'
            '6f5fd31ac7a5b925838830b5e10ae052683f1793dad8501bffee3c6d883d8e9a')

pkgver() {
    cd "$srcdir"/rime-opencc_emoji_symbols
    local date=$(git log -1 --format="%cd" --date=short | sed s/-//g)
    local count=$(git rev-list --count HEAD)
    local commit=$(git rev-parse --short HEAD)
    echo "$date.r${count}.$commit"
}

prepare() {
  cd rime-opencc_emoji_symbols
  patch < ../es_modify.patch
}

package() {
  cd rime-opencc_emoji_symbols
  install -Dm644 es.{json,txt} -t "$pkgdir"/usr/share/rime-data/opencc/
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/rime-opencc-emoji-symbols/
}
