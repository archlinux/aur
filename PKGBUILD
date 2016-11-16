# Maintainer: Lukas Jirkovsky <l.jirkovsky AT gmail.com>
pkgname=rawtherapee-gtk3-git
pkgver=4021.8801570
pkgrel=1
pkgdesc="RAW photo editor"
arch=('i686' 'x86_64')
url="http://www.rawtherapee.com/"
license=('GPL3')
depends=('fftw' 'gtk3' 'glibmm' 'gtkmm3' 'lcms2' 'libcanberra' 'libiptcdata' 'desktop-file-utils' 'hicolor-icon-theme')
makedepends=('cmake' 'git')
provides=('rawtherapee')
conflicts=('rawtherapee')
source=('rawtherapee::git+https://github.com/Beep6581/RawTherapee.git#branch=gtk3-bugfix')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/rawtherapee"
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  mkdir -p "$srcdir/rawtherapee-build"
  cd "$srcdir/rawtherapee-build"

  cmake ../rawtherapee \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "$srcdir/rawtherapee-build"
  make DESTDIR="$pkgdir/" install
}
