# Maintainer: Andreas Baumann <mail@andreasbaumann.cc>

pkgname=newsboat-og
pkgver=2.13.1
pkgrel=2
pkgdesc="An RSS/Atom feed reader for text terminals (old gen)"
arch=('x86_64' 'i486' 'i686' 'pentium4')
url="https://newsboat.org/"
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
sha256sums=('074228c0597f20ac72aff0b99685e5af4b28b428adafbbd8a1f207a156eb63c9')

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
