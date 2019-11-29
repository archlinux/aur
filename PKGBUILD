# Maintainer: Anatol Pomozov
# Contributor: Thomas Krug <t.krug@elektronenpumpe.de>

pkgname=dsview-git
pkgver=1.01.r31.gb018742
pkgrel=1
pkgdesc='GUI programe for supporting various instruments from DreamSourceLab, including logic analyzer, oscilloscope, etc.'
arch=(i686 x86_64)
url='http://www.dreamsourcelab.com/'
license=(GPL3)
# Upstream added VCS dependency to libsigrokdecode :/
depends=(boost-libs qt5-base fftw libsigrok4dsl-git libsigrokdecode4dsl-git)
makedepends=(boost cmake)
source=(git://github.com/DreamSourceLab/DSView) #branch=develop
sha1sums=('SKIP')

pkgver() {
  cd DSView
  git describe --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd DSView/DSView
  sed 's|/usr/local/|/usr/|' -i DSView.desktop
}

build() {
  cd DSView/DSView

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd DSView/DSView

  make DESTDIR="$pkgdir" install
  #install -Dm644 icons/logo_color.png "$pkgdir/usr/share/pixmaps/dsview.png"
}
