# Maintainer: Moritz Schoenherr <moritz.schoenherr[at]gmail[dot]com>
pkgname=crawl
pkgver=0.26.0
pkgrel=1
pkgdesc="Crawl stonesoup, curses version"
url="http://crawl.develz.org/"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('lua51' 'sqlite' 'zlib' )
makedepends=('git')
conflicts=()
replaces=()
backup=()
source=("https://github.com/crawl/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('6306c835246057bf91b6690fde14c2c3433ebe1d526876f96c46fab6dc109d45')

prepare() {

  cd "${srcdir}/${pkgname}-${pkgver}/crawl-ref/source"
	
  echo $pkgver > util/release_ver

}

build() {

  cd "${srcdir}/${pkgname}-${pkgver}/crawl-ref/source"
  NPROC=$(getconf _NPROCESSORS_ONLN)
  make -j${NPROC} \
  prefix=/usr \
  bin_prefix=bin \
  DESTDIR=$pkgdir \
  SAVEDIR='~/.crawl' \
  LUA_PACKAGE=lua51

}

package() {

  cd "${srcdir}/${pkgname}-${pkgver}/crawl-ref/source"
  make install \
  prefix=/usr \
  bin_prefix=bin \
  DESTDIR=$pkgdir \
  SAVEDIR='~/.crawl' \
  LUA_PACKAGE=lua51

}

