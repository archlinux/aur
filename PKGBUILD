# Maintainer: Frestein <fresteinart@gmail.com>

pkgname=lem-nightly
pkgver=nightly.latest.r0.g96b8faa57
pkgrel=1
pkgdesc="Common Lisp editor/IDE with ncurses frontend (nightly build)"
arch=('x86_64')
url="https://github.com/lem-project/lem"
license=('MIT')
depends=('sbcl' 'ncurses' 'enchant' 'tree-sitter')
makedepends=('git' 'make' 'qlot' 'sbcl' 'ncurses' 'enchant' 'tree-sitter')
optdepends=('libvterm: for integrated terminal' 'fd: for fuzzy file search')
conflicts=('lem' 'lem-webview' 'lem-webview-nightly' 'lem-ncurses')
options=('!strip')
source=("${pkgname}::git+https://github.com/lem-project/lem.git#tag=nightly-latest")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname}"
  make ncurses
}

package() {
  cd "${pkgname}"
  install -Dm755 lem "${pkgdir}/usr/bin/lem"
  install -Dm644 scripts/install/lem-ncurses.desktop \
    "${pkgdir}/usr/share/applications/lem-nightly.desktop"
  sed -i 's|/usr/local/bin/lem|/usr/bin/lem|' \
    "${pkgdir}/usr/share/applications/lem-nightly.desktop"
  install -Dm644 scripts/install/lem.svg \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/lem.svg"
}

# vim:set ts=2 sw=2 et:
