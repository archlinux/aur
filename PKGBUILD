# Copied from Florian Bruhin's PKGBUILD
pkgname=newsbeuter2.8
pkgver=1728.e425e3e
pkgrel=2
pkgdesc='A RSS feed reader for the text console with special Podcast support.'
url='http://www.newsbeuter.org'
arch=('i686' 'x86_64')
license=('MIT')
depends=('sqlite3' 'curl' 'libxml2' 'stfl' 'json-c')
optdepends=('ruby')
makedepends=('git' 'swig' 'asciidoc' 'docbook-xsl' 'pkgconfig')
options=('docs' '!libtool')
conflicts=('newsbeuter' 'newsbeuter-git')
source=('git://github.com/akrennmair/newsbeuter.git#tag=r2.8')
sha1sums=('SKIP')

pkgver() {
  cd "$srcdir/newsbeuter"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "$srcdir/newsbeuter"
  sed -i "s#ncursesw5#ncursesw6#g" config.sh
  ./config.sh
  make
  make doc
}

package() {
  cd "$srcdir/newsbeuter"

  make prefix=/usr "DESTDIR=${pkgdir}" install
  install -Dm644 LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}

# vim:set ts=2 sw=2 et:

