# Maintainer: Lukas Jirkovsky <l.jirkovsky AT gmail.com>
pkgname=rawtherapee-git
pkgver=3314.0b32f12
pkgrel=1
pkgdesc="RAW photo editor"
arch=('i686' 'x86_64')
url="http://www.rawtherapee.com/"
license=('GPL3')
depends=('fftw' 'gtkmm' 'libcanberra' 'libiptcdata' 'lcms2' 'desktop-file-utils' 'hicolor-icon-theme')
optdepends=('gtk-engines: workaround theme bug under GNOME')
makedepends=('cmake' 'git')
provides=('rawtherapee')
conflicts=('rawtherapee')
install=rawtherapee.install
source=('rawtherapee::git+https://github.com/Beep6581/RawTherapee.git')
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
