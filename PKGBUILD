# Maintainer: André Kugland <kugland at gmail dot com>

pkgname=ttf-tiro-indigo-git
_fonttype=${pkgname/-*/} # otf/ttf
pkgver=r41.24f67ca
pkgrel=1
arch=(any)
url="https://github.com/TiroTypeworks/Indigo"
license=('OFL')
source=("$pkgname::git+https://github.com/TiroTypeworks/Indigo")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  mkdir -p "$pkgdir"/usr/share/fonts/TiroIndigo-$_fonttype
  for lang in Bangla DevaHindi DevaMarathi DevaSanskrit Gurmukhi Kannada Tamil Telugu; do
  (
    cd "$pkgname"/fonts/Tiro${lang}/$(echo $_fonttype | tr '[:lower:]' '[:upper:]')
    install -Dm644 *.$_fonttype "$pkgdir"/usr/share/fonts/TiroIndigo-$_fonttype
  )
  done
  install -Dm644 "$pkgname"/fonts/OFL.txt "$pkgdir"/usr/share/licenses/$pkgname
}
