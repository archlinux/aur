# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=gimp-plugin-fblur
pkgver=3.2.6
pkgrel=6
pkgdesc="Makes out of focus with luminosity and depth"
arch=('x86_64')
url="https://registry.gimp.org/node/1444"
license=('GPL')
depends=('gimp' 'fftw')
makedepends=('intltool')
source=(https://raw.githubusercontent.com/pixlsus/registry.gimp.org_static/master/registry.gimp.org/files/focusblur-$pkgver.tar.bz2 \
        use_glib_h.diff)
md5sums=('6196c88aeee8733bacc3c6e9ac3c6cf8'
         'b654ec87f28589b84625c0683dbe1273')

prepare() {
  cd "$srcdir"/focusblur-$pkgver
  patch -Np1 < "$srcdir"/use_glib_h.diff
}

build() {
  cd "$srcdir"/focusblur-$pkgver
  ./configure CFLAGS="${CFLAGS} -DGIMP_DISABLE_DEPRECATED" --prefix=/usr LIBS=-lm
  make
}

package() {
  cd "$srcdir"/focusblur-$pkgver
  make DESTDIR="$pkgdir" install
}
