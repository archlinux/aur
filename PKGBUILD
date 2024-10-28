# Maintainer: Nebulosa <nebulosa2007-at-yandex-dot-ru>

pkgname=rdrview
pkgver=0.1.3
pkgrel=1
pkgdesc="Firefox Reader View as a command line tool"
arch=(x86_64)
url="https://github.com/eafer/$pkgname"
license=(Apache-2.0)
depends=(
  curl
  glibc
  libseccomp
  libxml2
)
makedepends=(
  git
)
optdepends=(
  'elinks: open pages in elinks'
  'libcurl-gnutls: backend that provides the SSL support'
  'links: open pages in links'
  'lynx: open pages in lynx'
  'w3m: open pages in w3m'
  'xdg-utils: for opening pages'
)
options=(!debug)
source=(
  $url/archive/v$pkgver/$pkgname-$pkgver.tar.gz
)
b2sums=('563b61c7dc14832aa809cbf00c62f3771d2d497b946cdaa5f9ca17d8bfb741c43bd885bbd1a3fdefed5beedf6039013066a8957e0a518833f1ac8c33725d582e')

prepare(){
  cd $pkgname-$pkgver
  local _commit=$(zcat ../$pkgname-$pkgver.tar.gz | git get-tar-commit-id)
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
