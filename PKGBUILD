# Maintainer: Thomas Krug <t.krug@elektronenpumpe.de>
# Contributor: Thomas Krug <t.krug@elektronenpumpe.de>
# Maintainer: Cody Schafer <aur@codyps.com>

pkgname=dsview
pkgver=0.98
pkgrel=1
pkgdesc="Client software that supports the DreamSourceLab logic analyzer"
arch=('i686' 'x86_64')
url="http://www.dreamsourcelab.com/"
license=('GPL3')
depends=('boost-libs' 'qt5-base' 'libsigrokdecode' 'fftw')
makedepends=('boost')

source=("git+https://github.com/DreamSourceLab/DSView.git#tag=$pkgver"
        'udev.rules'
        'dsview.desktop')
md5sums=('SKIP'
         'af6d97ba0fbea628e320bdb4b469b766'
         '095886809795b40d663bfe4b79395811')
install=dsview.install

prepare() {
  cd "$srcdir/DSView/DSView"
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_SKIP_RPATH=1 .
}

build() {
  cd "$srcdir/DSView/DSView"
  cmake .
  make
}

package() {
  cd "$srcdir/DSView/DSView"

  make DESTDIR="$pkgdir" PREFIX=/usr install

  install -Dm644 "$srcdir/dsview.desktop" "$pkgdir/usr/share/applications/dsview.desktop"
  install -Dm644 "$srcdir/udev.rules" "$pkgdir/usr/lib/udev/rules.d/20-dsview.rules"
}

# vim:set ts=2 sw=2 et:
