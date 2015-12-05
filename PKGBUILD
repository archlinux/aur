# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Gergely Imreh <imrehg(at)gmail(dot)com>

pkgname=io
pkgver=2015.11.11
pkgrel=1
pkgdesc='IO programming language'
arch=('x86_64' 'i686')
url='http://iolanguage.com/'
license=('BSD')
depends=('pcre' 'libsndfile' 'libxmu' 'freetype2' 'libedit' 'libxml2' 'libtiff' 'libevent' 'yajl' 'libmysqlclient' 'lzo' 'libpng' 'python2' 'util-linux' 'freeglut' 'libjpeg-turbo' 'libtheora')
makedepends=('cmake' 'git')
options=('!makeflags' '!buildflags')
source=("git://github.com/stevedekorte/io#tag=$pkgver")
md5sums=('SKIP')

build() {
  cd io
  sed -i "s:20140919:${pkgver//./}:" libs/iovm/source/IoVersion.h
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make # Does not build with ninja
}

package() {
  cd io
  make -C build DESTDIR="$pkgdir" install
  install -Dm644 license/bsd_license.txt \
    "$pkgdir/usr/share/licenses/$pkgname/bsd_license.txt"
}

# vim:set ts=2 sw=2 et:
