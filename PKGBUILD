# Maintainer: Nebulosa <nebulosa2007-at-yandex-dot-ru>

pkgname=rdrview
pkgver=0.1.1
pkgrel=3
_commit=30cb8782afeae5b15c7026d9f7801f3ceb330a62
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
  'links: open pages in links'
  'lynx: open pages in lynx'
  'w3m: open pages in w3m'
)
options=(!debug)
source=(
  $url/archive/v$pkgver/$pkgname-$pkgver.tar.gz
  001.patch::$url/commit/$_commit.patch
)
b2sums=(
  'fe964f74780baeeb5315982152a5667436356e41464fffb418990d3efe5fbddf5bdfdd13326450a8c1b8914fc0fd27292aab4d004cebcf7f81be2c853028eeec'
  'da1cc8f97479ffc9c76079e4dc40211f6ca90aca40646a4a7ab53a5df38c806994da87eb58d928f8feb8ddaf399bef77577fff92524df5abfcfec842bc436c61'
)

prepare(){
  cd $pkgname-$pkgver
  patch -Np1 < ../001.patch
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
