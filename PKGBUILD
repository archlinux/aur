# Maintainer: Anatol Pomozov
# Contributor: Thomas Krug <t.krug@elektronenpumpe.de>

pkgname=dsview-git
pkgver=0.95.r40.g7665ade
pkgrel=1
pkgdesc='GUI programe for supporting various instruments from DreamSourceLab, including logic analyzer, oscilloscope, etc.'
arch=(i686 x86_64)
url='http://www.dreamsourcelab.com/'
license=(GPL3)
# Upstream added VCS dependency to libsigrokdecode :/
depends=(boost-libs qt5-base libsigrok4dsl-git libsigrokdecode4dsl-git)
makedepends=(boost cmake)
source=(git://github.com/DreamSourceLab/DSView#branch=develop
        udev.rules)
sha1sums=('SKIP'
          '50f23061fcd03e0aafdefb3b676f1846c036c856')

pkgver() {
  cd DSView
  git describe --long | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd DSView/DSView

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd DSView/DSView

  make DESTDIR="$pkgdir" install

  install -Dm644 icons/logo_color.png "$pkgdir/usr/share/pixmaps/dsview.png"
  install -Dm644 "$srcdir/udev.rules" "$pkgdir/usr/lib/udev/rules.d/20-dsview.rules"
}
