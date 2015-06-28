# Maintainer: Lukas Jirkovsky <l.jirkovsky AT gmail.com>
pkgname=rawtherapee-hg
pkgver=2253.efcd2c7d3aa5
pkgrel=1
pkgdesc="RAW photo editor"
arch=('i686' 'x86_64')
url="http://www.rawtherapee.com/"
license=('GPL3')
depends=('fftw' 'gtkmm' 'libcanberra' 'libiptcdata' 'lcms2' 'desktop-file-utils' 'hicolor-icon-theme')
makedepends=('cmake' 'mercurial')
provides=('rawtherapee')
conflicts=('rawtherapee')
install=rawtherapee.install
source=('rawtherapee::hg+https://code.google.com/p/rawtherapee')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/rawtherapee"
  echo $(hg identify -n).$(hg identify -i)
}

build() {
  cd "$srcdir/rawtherapee"

  cmake -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    .
  make
}

package() {
  cd "$srcdir/rawtherapee"
  make DESTDIR="$pkgdir/" install
}
