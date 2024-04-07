# Maintainer: xiota / aur.chaotic.cx

_pkgname='geany-plugin-preview'
pkgname="$_pkgname"
pkgdesc="Plugin for Geany to preview lightweight markup languages"
url="https://github.com/xiota/geany-preview"
pkgver=0.1.0
pkgrel=1
license=('GPL-3.0-or-later')
arch=('x86_64')

depends=(
  'cmark-gfm'
  'geany'
  'libpodofo.so' # podofo
  'webkit2gtk'
)
makedepends=(
  'git'
)
optdepends=(
  # AUR
  'ttf-courier-prime: Export Fountain screenplays to PDF'
)

_pkgsrc="geany-preview"
source=("$_pkgsrc"::"git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

prepare() {
  cd "$_pkgsrc"
  autoreconf -vfi

  local _configure_options=(
    --prefix='/usr'
  )

  ./configure "${_configure_options[@]}"
}


build() {
  cd "$_pkgsrc"
  make
}

package() {
  cd "$_pkgsrc"
  make install DESTDIR="$pkgdir"
}
