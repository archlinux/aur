# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Gergely Imreh <imrehg(at)gmail(dot)com>
 
pkgname=io
pkgver=2013.12.04
pkgrel=1
pkgdesc='IO programming language'
arch=('x86_64' 'i686')
url='http://iolanguage.com/'
license=('BSD')
depends=('pcre' 'libsndfile' 'libxmu' 'freetype2' 'libedit' 'libxml2' 'libtiff' 'libevent' 'yajl' 'libmysqlclient' 'lzo2' 'libpng' 'python2' 'util-linux' 'freeglut' 'libjpeg-turbo' 'libtheora')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/stevedekorte/io/tarball/$pkgver")
options=('!makeflags' '!buildflags')
sha256sums=('a5ca07b4d211995a0cd9442e1d752b2824444bee018c6db31899ddd6c5c87c4f')

build() {
  cd stevedekorte-io-*
  sed -i "s:20110905:${pkgver//./}:" libs/iovm/source/IoVersion.h
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd stevedekorte-io-*
  make -C build DESTDIR="$pkgdir" install
  install -Dm644 license/bsd_license.txt \
    "$pkgdir/usr/share/licenses/$pkgname/bsd_license.txt"
}

# vim:set ts=2 sw=2 et:
