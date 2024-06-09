# Maintainer: Nebulosa <nebulosa2007-at-yandex-dot-ru>

pkgname=rdrview
pkgver=0.1.2
pkgrel=1
_commit=36428005eabfb1a8d1b203ee47fa59303793fcb0
pkgdesc="Firefox Reader View as a command line tool"
arch=(x86_64)
url="https://github.com/eafer/$pkgname"
license=(Apache-2.0)
depends=(
  curl
  glibc
  libseccomp
  libxml2
  xdg-utils
)
optdepends=(
  'elinks: open pages in elinks'
  'libcurl-gnutls: backend that provides the SSL support'
  'links: open pages in links'
  'lynx: open pages in lynx'
  'w3m: open pages in w3m'
)
options=(!debug)
source=(
  $url/archive/v$pkgver/$pkgname-$pkgver.tar.gz
)
b2sums=('6d46824cc2ce76337bf3ed05631e5d04b8985d8abdf3c64642e32e33a181e3afaacbca70d54059aef6fc207672065ecc9cd8247b064610ef4116c96f98a6f60a')

prepare(){
  cd $pkgname-$pkgver
  sed -i 's/GIT_COMMIT = $(shell git rev-parse --short HEAD)/GIT_COMMIT = '${_commit:0:7}'/' Makefile
}

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  make PREFIX="${pkgdir}/usr" install
}
