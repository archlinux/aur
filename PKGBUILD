# Maintainer: Antony Jordan <antony.r.jorda at gmail dot com>
# Co-Maintainer: Stephanie Wilde-Hobbs <arch at stephanie dot is>
pkgname=nanovna-saver
pkgver=0.6.8
pkgrel=1
pkgdesc="PC control for the NanoVNA."
arch=(any)
url="https://github.com/NanoVNA-Saver/nanovna-saver"
license=('GPL3')
depends=(python-pyqt6 python-scipy python-numpy python-pyserial qt5-base python-setuptools-scm)
makedepends=(python-setuptools)
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/NanoVNA-Saver/nanovna-saver/archive/v$pkgver.tar.gz"
  "$pkgname.desktop"
)
sha256sums=('3c9a45184d12da13440e22f77829956e875dfc7f864dcdd7369dd8832df31fd8'
            'b67fb284bc6a8ece865df8c117acd84f87141ab543fdd2959754250cf0b06b9e')

build() {
  cd "$pkgname-$pkgver"
  SETUPTOOLS_SCM_PRETEND_VERSION_FOR_NANOVNASAVER="${pkgver}" \
    python ./setup.py build
}

package() {
  cd "$pkgname-$pkgver"
  SETUPTOOLS_SCM_PRETEND_VERSION_FOR_NANOVNASAVER="${pkgver}" \
    python ./setup.py install --prefix=/usr --root="$pkgdir"

  mkdir -p "$pkgdir/usr/share/pixmaps"
  cp icon_48x48.png "$pkgdir/usr/share/pixmaps/$pkgname.png"

  mkdir -p "$pkgdir/usr/share/applications"
  cd ..
  cp $pkgname.desktop "$pkgdir/usr/share/applications"
}
