# Maintainer: qwjyh <urataw421 at gmail dot com>

pkgname=fcitx-table-unicode-latex-git
_pkgname="${pkgname%-git}"
pkgver=r125.6e9b0af
pkgrel=1
pkgdesc="fcitx table with LaTeX macros to input unicode symbols"
arch=('any')
url='https://github.com/hubutui/fcitx-table-unicode-latex'
license=('MIT')
source=("${_pkgname}::git+https://github.com/hubutui/fcitx-table-unicode-latex.git")
sha512sums=('SKIP')
depends=('fcitx')
makedepends=('git')

pkgver() {
  cd "${_pkgname}" || exit 1
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_pkgname}/fcitx-table" || exit 1
  txt2mb latex-unicode.txt latex-unicode.mb
}

package() {
  cd "${_pkgname}/fcitx-table" || exit 1

  install -d "$pkgdir/usr/share/fcitx/table/"
  install -m644 latex-unicode.conf "$pkgdir/usr/share/fcitx/table/"
  install -m644 latex-unicode.mb "$pkgdir/usr/share/fcitx/table/"
}
