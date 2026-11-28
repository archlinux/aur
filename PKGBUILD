# Maintainer: Frestein <fresteinart@gmail.com>

pkgname=lem-sdl2
pkgver=2.3.0
pkgrel=1
pkgdesc='Common Lisp editor/IDE with SDL2 frontend'
arch=('x86_64')
url='https://github.com/lem-project/lem'
license=('MIT')
depends=('sbcl' 'sdl2-compat' 'sdl2_image' 'sdl2_ttf')
makedepends=('git' 'make' 'qlot' 'sbcl' 'sdl2-compat' 'sdl2_image' 'sdl2_ttf')
optdepends=('libvterm: for integrated terminal' 'fd: for fuzzy file search')
conflicts=('lem' 'lem-nightly' 'lem-webview' 'lem-webview-nightly' 'lem-sdl3-nightly')
options=('!strip')
source=("${pkgname}-${pkgver}::git+https://github.com/lem-project/lem.git#tag=v${pkgver}")
sha256sums=('a59fe4b3f9f214b7e8e308649a60f94b4acbde695f2aaa73fbb0444ce67b89b1')

build() {
  cd "${pkgname}-${pkgver}"
  make sdl2
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 lem "${pkgdir}/usr/bin/lem"
  install -Dm644 scripts/install/lem-sdl2.desktop \
    "${pkgdir}/usr/share/applications/lem-sdl2.desktop"
  sed -i 's|/usr/local/bin/lem|/usr/bin/lem|' \
    "${pkgdir}/usr/share/applications/lem-sdl2.desktop"
  install -Dm644 scripts/install/lem.svg \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/lem.svg"
}

# vim:set ts=2 sw=2 et:
