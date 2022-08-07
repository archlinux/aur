# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Jens Staal <staal1978@gmail.com>
# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Sven Pfleiderer <pfleidi@roothausen.de>

pkgname=newsboat-git
pkgver=2.23.r225.g643dae9d
pkgrel=1
pkgdesc="An RSS/Atom feed reader for text terminals"
arch=('x86_64')
url="https://newsboat.org/"
license=('MIT')
depends=('curl' 'hicolor-icon-theme' 'json-c' 'libxml2' 'sqlite' 'stfl')
makedepends=('asciidoctor' 'git' 'rust' 'swig')
optdepends=('perl: for pinboard.pl'
            'python: for exportOPMLWithTags.py'
            'ruby: for feedgrabber.rb, heise.rb, and slashdot.rb')
provides=('newsboat')
conflicts=('newsboat')
replaces=('newsbeuter')
options=('!lto')
source=('git+https://github.com/newsboat/newsboat.git')
sha256sums=('SKIP')

pkgver() {
  cd newsboat

  git describe --long | sed 's/^r//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd newsboat

  make prefix=/usr
  make doc
}

package() {
  cd newsboat

  make prefix=/usr DESTDIR="$pkgdir" install
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}
