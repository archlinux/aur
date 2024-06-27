# Maintainer: Andreas Baumann <mail@andreasbaumann.cc>

pkgname=newsboat-og
pkgver=2.13.2
pkgrel=2
pkgdesc="An RSS/Atom feed reader for text terminals (old gen)"
arch=('x86_64' 'i486' 'i686' 'pentium4')
url="https://github.com/andreasbaumann/newsboat-og"
license=('MIT')
depends=('curl' 'hicolor-icon-theme' 'json-c' 'libxml2' 'sqlite' 'stfl')
makedepends=('asciidoc')
optdepends=('perl: for pinboard.pl'
            'python: for exportOPMLWithTags.py'
            'ruby: for feedgrabber.rb, heise.rb, and slashdot.rb')
replaces=('newsbeuter')
conflicts=('newsboat')
options=('!makeflags')
source=("https://github.com/andreasbaumann/$pkgname/archive/r$pkgver.tar.gz")
sha256sums=('b6646c92e87590b8780111a03ecda139faa846c1fb030bf02f0d89edbff9b8cc')

build() {
  cd $pkgname-r$pkgver

  make prefix=/usr
  make doc
}

package() {
  cd $pkgname-r$pkgver

  make prefix=/usr DESTDIR="$pkgdir" install
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}
