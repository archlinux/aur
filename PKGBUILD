# $Id: PKGBUILD,v 1.5 2009/06/01 09:23:43 sergej Exp $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Maxim Vuets <maxim.vuets@gmail.com>

pkgname=cuneiform
pkgver=0.7
pkgrel=1
pkgdesc="Linux port of an OCR system developed in Russia. Supports more than 20 languages."
arch=('i686' 'x86_64')
url="https://launchpad.net/cuneiform-linux"
license=('BSD')
depends=(imagemagick)
makedepends=(cmake)
source=(http://launchpad.net/cuneiform-linux/$pkgver/$pkgver/+download/$pkgname-linux-$pkgver.tar.bz2 \
        cuneiform.patch)
md5sums=('a13c91a4c2f88b7573e1b3d3306436e2'
         'ad3e40904a50ea68e87017f1c0248aa0')

build() {
  _SRC_ROOT="$srcdir/$pkgname-linux-$pkgver"
  cd "${_SRC_ROOT}"
  sed -i 's#lib64#lib#' install_files.cmake 
  mkdir builddir
  cd builddir

  cmake -DCMAKE_BUILD_TYPE=release -DCMAKE_INSTALL_PREFIX=/usr .. || return 1
  make || return 1
  make DESTDIR="$pkgdir" install || return 1

  mkdir -p "$pkgdir/usr/share/licenses/cuneiform"
  cp "${_SRC_ROOT}/cuneiform_src/Kern/license.txt" \
    "$pkgdir/usr/share/licenses/cuneiform"
}
