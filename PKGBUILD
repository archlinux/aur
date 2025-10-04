# Maintainer: Nebulosa <nebulosa2007-at-yandex-dot-ru>

pkgname=rdrview
pkgver=0.1.5
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
sha512sums=('061d0241e6b24a0ad86ae30f5ca0ffd697b6f10ba5d66eb7ca83135095cd0e5efb8501166f55622465d861cd027d64a9568d1f567ba727dd35f5dcec60eaadf1')
b2sums=('9bd07ac1740c2834fadf7d469f028d200fe56295937eb962e8d19aaa9ea073ff1a1f4096e10c3d18977bd1525e5372a0188a2a9fd210a8ba0f112b7f3d75ae81')

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
  strip --strip-unneeded "$pkgdir/usr/bin/rdrview"
}
