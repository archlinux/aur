_gitname='geany-preview'
_pkgname="geany-plugin-preview"
pkgname="$_pkgname"
pkgdesc="Plugin for Geany to Preview lightweight markup languages, including AsciiDoc, DocBook, Fountain, LaTeX, Markdown, MediaWiki, reStructuredText, Textile, and Txt2Tags."
url="https://github.com/xiota/geany-preview"
pkgver=0.0.3
pkgrel=1
arch=(x86_64)
license=(GPL)
depends=(
  'cmark-gfm'
  'geany'
  'podofo'
  'webkit2gtk'
)
makedepends=(
  'git'
)

provides=("$pkgname")
conflicts=(${provides[@]})

source=(
  "$_gitname"::"git+$url#tag=v$pkgver"
)
sha256sums=(
  'SKIP'
)

prepare() {
  cd "$srcdir/$_gitname"
  autoreconf -vfi
  CFLAGS+=' -O3' CXXFLAGS+=' -O3' ./configure --prefix=/usr
}

build() {
  cd "$srcdir/$_gitname"
  make
}

package() {
  cd "$srcdir/$_gitname"
  make install DESTDIR="$pkgdir"
}
