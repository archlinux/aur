# Maintainer: Frestein <fresteinart@gmail.com>

pkgname=lem
pkgver=2.3.0
pkgrel=2
pkgdesc='Common Lisp editor/IDE with ncurses frontend'
arch=('x86_64')
url='https://github.com/lem-project/lem'
license=('MIT')
depends=('sbcl' 'ncurses')
makedepends=('git' 'make' 'qlot' 'sbcl' 'ncurses')
optdepends=('libvterm: for integrated terminal' 'fd: for fuzzy file search')
conflicts=('lem-webview' 'lem-webview-nightly' 'lem-nightly' 'lem-sdl2' 'lem-sdl3-nightly')
options=('!strip')
source=("${pkgname}-${pkgver}::git+https://github.com/lem-project/lem.git#tag=v${pkgver}")
sha256sums=('a59fe4b3f9f214b7e8e308649a60f94b4acbde695f2aaa73fbb0444ce67b89b1')

build() {
  cd "${pkgname}-${pkgver}"
  make ncurses
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 lem "${pkgdir}/usr/bin/lem"
  install -Dm644 scripts/install/lem-ncurses.desktop \
    "${pkgdir}/usr/share/applications/lem.desktop"
  sed -i 's|/usr/local/bin/lem|/usr/bin/lem|' \
    "${pkgdir}/usr/share/applications/lem.desktop"
  install -Dm644 scripts/install/lem.svg \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/lem.svg"
}

# vim:set ts=2 sw=2 et:
