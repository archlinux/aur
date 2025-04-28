# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: tee < teeaur at duck dot com >

pkgname=lastfmlib
pkgver=0.4.0
pkgrel=2
pkgdesc='A library that provides an implementation of the Last.fm protocol'
arch=('x86_64')
url='http://code.google.com/archive/p/lastfmlib'
license=('GPL-2.0-only')
depends=('curl')
options=('!libtool')
source=("https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/$pkgname/$pkgname-$pkgver.tar.gz")
b2sums=('2e38adb90a468eccf959950d89e2e0b903e7e96c871b4d20216ee233933392fda7cd3bd86d90472e0f305922dc11e1dc998206c669a13be76eab7fdd07e6b45b')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  sed -i 's|string to|wstring to|' lastfmlib/utils/stringoperations.h
  ./configure --prefix=/usr || return 1
  make || return 1
}
package() {
  cd "$srcdir"/$pkgname-$pkgver
  make DESTDIR="$pkgdir" install || return 1
}
