# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Gergely Imreh <imrehg@gmail.com>

pkgname=io
pkgver=2017.06.08
pkgrel=8
pkgdesc='IO programming language'
arch=('x86_64')
url='http://iolanguage.com/'
license=('BSD')
depends=('pcre' 'libsndfile' 'libxmu' 'freetype2' 'libedit' 'libxml2' 'libtiff' 'libevent' 'yajl' 'mariadb-libs' 'lzo' 'libpng' 'util-linux' 'freeglut' 'libjpeg-turbo' 'libtheora' 'python')
makedepends=('cmake' 'git')
options=('!makeflags' '!buildflags')
source=("git+https://github.com/stevedekorte/io#commit=5fffec7cbe9679632ff793befacedd92f79d7f0f" build.patch)
sha256sums=('SKIP'
            '67649900fba515520c934dcb24c4da475c11c84a7e83171418c742988304b80e')

prepare() {
  sed -i "s:20151111:${pkgver//./}:" io/libs/iovm/source/IoVersion.h

  cd io
  patch -Np1 -i ${srcdir}/build.patch
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
