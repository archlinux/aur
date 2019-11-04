# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Gergely Imreh <imrehg@gmail.com>

pkgname=io
pkgver=2017.06.08
pkgrel=7
pkgdesc='IO programming language'
arch=('x86_64')
url='http://iolanguage.com/'
license=('BSD')
depends=('pcre' 'libsndfile' 'libxmu' 'freetype2' 'libedit' 'libxml2' 'libtiff' 'libevent' 'yajl' 'mariadb-libs' 'lzo' 'libpng' 'util-linux' 'freeglut' 'libjpeg-turbo' 'libtheora' 'python')
makedepends=('cmake' 'git')
options=('!makeflags' '!buildflags')
source=("git+https://github.com/stevedekorte/io#commit=5fffec7cbe9679632ff793befacedd92f79d7f0f")
sha256sums=('SKIP')

prepare() {
  sed -i "s:20151111:${pkgver//./}:" io/libs/iovm/source/IoVersion.h
}

build() {
  mkdir -p build
  cd build
  cmake ../io -DCMAKE_INSTALL_PREFIX=/usr
}

package() {
  DESTDIR="$pkgdir" make -C build install
  install -Dm644 io/license/bsd_license.txt \
    "$pkgdir/usr/share/licenses/$pkgname/bsd_license.txt"
}

# vim: ts=2 sw=2 et:
