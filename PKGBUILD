# Maintainer: René Wagner <rwagner@rw-net.de>
# Contributor: Moritz Schoenherr <moritz.schoenherr[at]gmail[dot]com>
pkgname=crawl
pkgver=0.28.0
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
sha256sums=('287f35476d20bbe8aaa3e663140704462b4e304a4e1ed5c2b5da1d273dd1f383')

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

