# Maintainer: Lukas Jirkovsky <l.jirkovsky AT gmail.com>
pkgname=rawtherapee-git
pkgver=2971.11d382d
pkgrel=1
pkgdesc="RAW photo editor"
arch=('i686' 'x86_64')
url="http://www.rawtherapee.com/"
license=('GPL3')
depends=('fftw' 'gtkmm' 'libcanberra' 'libiptcdata' 'lcms2' 'desktop-file-utils' 'hicolor-icon-theme')
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
  cd "$srcdir/rawtherapee"

  cmake . \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "$srcdir/rawtherapee"
  make DESTDIR="$pkgdir/" install
}
