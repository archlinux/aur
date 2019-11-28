# ---------------------------------------------------------------
# Maintainer: Romain Bazile <gromain.baz@gmail.com>
# ---------------------------------------------------------------

pkgname=xygrib
pkgver=1.2.6.1
pkgrel=1
pkgdesc="Grib reader and weather visualization software. Zygrib fork."
arch=('x86_64' 'aarch64')
license=("GPL3")
provides=('xygrib')
conflicts=('xygrib-git')
depends=('libnova' 'qwt' 'proj' 'qt5-base' 'openjpeg2')
makedepends=('cmake' 'zlib' 'bzip2' 'libpng')
url="https://opengribs.org/"
source=("https://github.com/opengribs/XyGrib/archive/v1.2.6.1.tar.gz" "xygrib.install")
sha1sums=('8e3431ed6a5ef114d77ac57029129a26a381f696'
          '58925746bf6ac941ab34e268517581f1e01e9cff')


build() {
  cd $srcdir/XyGrib-$pkgver
  mkdir -p build
  cd build
  cmake ../
  make
}

package() {
  mkdir -p $pkgdir/usr/share/icons/hicolor
  mkdir -p $pkgdir/usr/share/applications
  mkdir -p $pkgdir/usr/bin
  cd $srcdir/XyGrib-$pkgver
  cp linux_online_installer/config/xyGrib_32.png $pkgdir/usr/share/icons/hicolor/xygrib.png
  cp debian/xygrib.desktop $pkgdir/usr/share/applications/
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr/share/openGribs/ ../
  DESTDIR="$pkgdir" make install
  mv $pkgdir/usr/share/openGribs/XyGrib/XyGrib $pkgdir/usr/bin/
}
