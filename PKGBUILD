# Maintainer: Anatol Pomozov
# Co-Maintainer: Abdelhak Bougouffa <abougouffa@fedoraproject.org>
# Contributor: Thomas Krug <t.krug@elektronenpumpe.de>

pkgname=dsview-git
pkgver=1.2.0.r15.g9264bce
pkgrel=1
pkgdesc='GUI programe for supporting various instruments from DreamSourceLab, including logic analyzer, oscilloscope, etc.'
arch=(i686 x86_64)
url='http://www.dreamsourcelab.com/'
license=(GPL3)
# Upstream added VCS dependency to libsigrokdecode :/
depends=(boost-libs qt5-base fftw)
makedepends=(boost cmake)
source=(git+https://github.com/DreamSourceLab/DSView) #branch=develop
sha1sums=('SKIP')

pkgver() {
  cd DSView
  git describe --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd DSView
  sed 's|/usr/local/|/usr/|' -i DSView/DSView.desktop
  sed 's| /lib/udev/rules.d| /usr/lib/udev/rules.d|' -i CMakeLists.txt
}

build() {
  cd DSView

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd DSView

  make DESTDIR="$pkgdir" install
  #install -Dm644 icons/logo_color.png "$pkgdir/usr/share/pixmaps/dsview.png"
}
