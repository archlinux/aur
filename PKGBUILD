# Maintainer: xiota / aur.chaotic.cx

_pkgname='geany-plugin-preview'
pkgname="$_pkgname"
pkgdesc="Plugin for Geany to preview markdown and other markup languages"
url="https://github.com/xiota/geany-preview"
pkgver=0.2.1
pkgrel=1
license=('GPL-3.0-or-later')
arch=('x86_64')

depends=(
  'cmark-gfm'
  'geany'
  'libpodofo.so' # podofo
  'webkit2gtk-4.1'
)
makedepends=(
  'git'
  'meson'
  'tomlplusplus'
)
optdepends=(
  'asciidoctor: For AsciiDoc'
  'pandoc: For many other file formats'
  'ttf-courier-prime: To export Fountain to PDF' # AUR
)

options=('!debug' '!lto' '!strip')

_pkgsrc="geany-preview"
source=(
  "$_pkgsrc"::"git+$url.git#tag=v$pkgver"
  'git+https://github.com/xiota/ftn2xml.git'
)
sha256sums=(
  '6d4416af323b4d92b9b4419ad5e69b5b84e1a5d7e9572271fa8546df9180a0f1'
  'SKIP'
)

prepare() {
  ln -sf "$srcdir/ftn2xml" "$_pkgsrc/subprojects/ftn2xml"
}

build() {
  arch-meson build "$_pkgsrc"
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
