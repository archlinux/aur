# Maintainer: Nebulosa <nebulosa2007-at-yandex-dot-ru>

pkgname=rdrview
pkgver=0.1.4
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
makedepends=(git)
optdepends=(
  'elinks: open pages in elinks'
  'libcurl-gnutls: backend that provides the SSL support'
  'links: open pages in links'
  'lynx: open pages in lynx'
  'w3m: open pages in w3m'
  'xdg-utils: for opening pages'
)
options=(!debug)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('fb88063daf64430c81c50b096b643e43b0e570434185058899b9ca6fa4436a83910ffcaa399f8dce50582091a4607941c19eae799b16935aee3def214bbbf8b2')
b2sums=('3d53e33e8ed890a52c2dbf2b3ae0fea1a6daeea70b13e19c6a4e039b7d2c1ac408f2d1be431650dcb35a6b3ad82770bbe8a71bc9ad3999bce2cab89ae7ac6b92')

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
