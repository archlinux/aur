# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgbase='swift'
pkgname=('swift-im' 'swiften')
pkgver=3.0rc2
pkgrel=1
arch=('i686' 'x86_64')
url="http://swift.im/"
license=('GPL3')
makedepends=('python2' 'openssl' 'boost' 'qt5-base' 'qt5-multimedia'
             'qt5-webkit' 'qt5-x11extras' 'qt5-tools')
source=("http://swift.im/downloads/releases/$pkgbase-$pkgver/$pkgbase-$pkgver.tar.gz")
sha256sums=('6816992ce3c47b2e0af570ee95eafa93d8571d3c30cfecb3a310adc9f10fa963')

# Those options need to be consistent between each scons invocation.
_scons_options='max_jobs=1 optimize=1 debug=0 swiften_dll=1'
_directory="$pkgbase-$pkgver"

build() {
  cd "$srcdir/$_directory"
  ./scons $_scons_options Swift Swiften
}

package_swift-im() {
  pkgdesc='XMPP client written in C++ with Qt and Swiften'
  depends=("swiften=$pkgver" 'qt5-base' 'qt5-multimedia' 'qt5-webkit' 'qt5-x11extras')
  optdepends=('qt5-svg: for SVG avatars')

  cd "$srcdir/$_directory"
  ./scons $_scons_options SWIFT_INSTALLDIR="$pkgdir/usr/" "$pkgdir/usr/"
}

package_swiften() {
  pkgdesc='XMPP library written in C++ with Boost'
  depends=('boost-libs')

  cd "$srcdir/$_directory"
  ./scons $_scons_options SWIFTEN_INSTALLDIR="$pkgdir/usr/" "$pkgdir/usr/"
}
