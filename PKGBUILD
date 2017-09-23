# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>
# Maintainer: Daniel M. Capella <polycitizen@gmail.com>
# Contributor: Thorsten Toepper <atsutane@freethoughts.de>

pkgname=newsboat
pkgver=2.10.1
pkgrel=1
pkgdesc='RSS feed reader for the text console with special Podcast support'
url=https://newsboat.org
arch=('i686' 'x86_64')
license=('MIT')
depends=('curl' 'json-c' 'libxml2' 'sqlite3' 'stfl')
optdepends=('ruby')
makedepends=('asciidoc' 'docbook-xsl' 'swig')
options=('docs' '!libtool')
source=("$url/releases/$pkgver/newsboat-$pkgver.tar.xz"{,.asc})
sha512sums=('f2e9e9f60aa3996977fd13cb54140ae035da0ad6e47c6f50646bf0f67e241fe27a7938879a489322a738fbcf34ac21fb899558435e0248b05d469d80e2ab0e1e'
            'SKIP')
validpgpkeys=('B8B1756A0DDBF0760CE67CCF4ED6CD61932B9EBE') # Newsboat project

build() {
  cd $pkgname-$pkgver
  ./config.sh
  make
  make doc
}

package() {
  cd $pkgname-$pkgver

  make prefix=/usr DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

}

# vim:set ts=2 sw=2 et:
