# Maintainer: René Wagner <rwagner@rw-net.de>
# Contributor: Moritz Schoenherr <moritz.schoenherr[at]gmail[dot]com>
pkgname=crawl
pkgver=0.31.0
pkgrel=1
pkgdesc="Crawl stonesoup, curses version"
url="http://crawl.develz.org/"
arch=('i686' 'x86_64' 'aarch64')
license=('GPL2')
depends=('lua51' 'sqlite' 'zlib' 'python-pyaml' )
makedepends=('make' 'gcc')
conflicts=()
replaces=()
backup=()
source=("https://github.com/crawl/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('23153c36dbf27e1910f4386e3ba112f64bd8489d53aa5df2b57c9536db752c0a')

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

