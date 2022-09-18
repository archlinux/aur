# Maintainer: Gavin Luo <lunt.luo#gmail.com>

pkgname=rime-emoji-git
_pkgname=rime-emoji
pkgver=0.0.0.20220315
pkgrel=2
pkgdesc="Emoji support for rime"
arch=('any')
url="https://github.com/rime/rime-emoji"
license=('LGPL')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("${_pkgname}::git+${url}.git#branch=master")
sha512sums=("SKIP")

pkgver() {
  cd "$srcdir/$_pkgname" || return
  printf "0.0.0.%s" "$(git log -1 --format=%cs | sed 's/-//g')"
}

package() {
  cd "$srcdir/$_pkgname" || return
  install -Dm644 emoji_suggestion.yaml -t "$pkgdir"/usr/share/rime-data/
  install -Dm644 opencc/*              -t "$pkgdir"/usr/share/rime-data/opencc/
}
