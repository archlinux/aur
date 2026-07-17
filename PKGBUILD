# Maintainer: Andreas Baumann <mail@andreasbaumann.cc>

pkgname=newsboat-og
pkgver=2.13.2
pkgrel=4
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
source=("$pkgname-$pkgver.tar.gz::https://github.com/andreasbaumann/$pkgname/archive/r$pkgver.tar.gz"
        "$pkgname-curl-proxytype-cast.patch::https://github.com/andreasbaumann/$pkgname/commit/f2b404c3c4853d27f5def7d21e0040dcffc0fe61.patch"
        "$pkgname-json-c-isystem.patch::https://github.com/andreasbaumann/$pkgname/commit/d11e3705b53cc219a47c7d6790faea841153d6c1.patch")
sha256sums=('b6646c92e87590b8780111a03ecda139faa846c1fb030bf02f0d89edbff9b8cc'
            '83ae846553482e11d3ffae9c8190b167f2f83c3e08622e24df712a643d487907'
            '48bdbf4fd88005d52a3c513d89dbfe5a2f9900419370259c9d7a3c7e4e1565b6')

prepare() {
  cd $pkgname-r$pkgver

  patch -Np1 < ../newsboat-og-curl-proxytype-cast.patch
  patch -Np1 < ../newsboat-og-json-c-isystem.patch
}

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
