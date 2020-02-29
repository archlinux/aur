# Maintainer: takiz <tacidd@gmail.com>

pkgname=newsbeuter-git
pkgver=2278.96e9506
pkgrel=1
pkgdesc='A RSS feed reader for the text console with special Podcast support.'
url='http://www.newsbeuter.org'
arch=('i686' 'x86_64')
license=('MIT')
depends=('sqlite3' 'curl' 'libxml2' 'stfl' 'json-c')
optdepends=('ruby')
makedepends=('git' 'swig' 'asciidoc' 'docbook-xsl' 'pkgconfig')
options=('docs' '!libtool')
conflicts=('newsbeuter')
source=('git+https://github.com/akrennmair/newsbeuter.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/newsbeuter"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "$srcdir/newsbeuter"
  ./config.sh
  export CXXFLAGS="-Wno-error=stringop-truncation -Wno-error=sign-compare"
  make
  make doc
}

package() {
  cd "$srcdir/newsbeuter"

  make prefix=/usr "DESTDIR=${pkgdir}" install
  install -Dm644 LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}


