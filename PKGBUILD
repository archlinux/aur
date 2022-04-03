# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=guile3.0-reader
_gitname=guile-reader
pkgver=0.6.3
pkgrel=2
pkgdesc="a simple framework for building readers for GNU Guile 3.0"
url="http://www.nongnu.org/guile-reader"
arch=('i686' 'x86_64')
license=('GPL')
depends=("guile>=3")
makedepends=('gperf' 'git')
source=("http://download.savannah.nongnu.org/releases/$pkgname/${_gitname}-$pkgver.tar.gz")
sha256sums=('38c2b444eadbb8c0cab78d90a44ec3ebff42bd410c5b84a91018cee7eb64d2bb')
options=('!strip' '!emptydirs')

build() {
  cd ${_gitname}-$pkgver
  autoreconf -i --force --verbose
  CFLAGS= CPPFLAGS= LDFLAGS= GUILE_EFFECTIVE_VERSION=3.0 GUILE=/usr/bin/guile3.0 \
	./configure --prefix=/usr 
  make
}

package() {
  cd ${_gitname}-$pkgver
  make DESTDIR="$pkgdir" install
  # avoid conflicts with guile-reader for guile 2.2
  rm "$pkgdir"/usr/include/guile-reader/*
  rmdir "$pkgdir"/usr/include/guile-reader
  rm "$pkgdir"/usr/lib/libguile-reader.so*
  rm "$pkgdir"/usr/share/info/{dir,guile-reader.info}
}
