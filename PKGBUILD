_gitname='geany-preview'
pkgname='geany-plugin-preview'
pkgdesc="Plugin for Geany to Preview lightweight markup languages, including AsciiDoc, DocBook, Fountain, LaTeX, Markdown, MediaWiki, reStructuredText, Textile, and Txt2Tags."
url="https://github.com/xiota/geany-preview"
pkgver=0.0.2
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
  ./autogen.sh
  ./configure --prefix=/usr
}

build() {
  cd "$srcdir/$_gitname"
  make
}

package() {
  cd "$srcdir/$_gitname"
  make install DESTDIR="$pkgdir"
}
