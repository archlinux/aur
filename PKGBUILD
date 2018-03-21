# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgbase='swift'
pkgname=('swift-im' 'swiften')
pkgver=4.0
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc='XMPP client written in C++ with Qt and Swiften'
url="http://swift.im/"
license=('GPL3')
makedepends=('python2' 'openssl' 'boost' 'qt5-base' 'qt5-multimedia'
             'qt5-webkit' 'qt5-x11extras' 'qt5-tools' 'qt5-svg')
source=("http://swift.im/downloads/releases/$pkgbase-$pkgver/$pkgbase-$pkgver.tar.gz")
sha256sums=('50b7b2069005b1474147110956f66fdde0afb2cbcca3d3cf47de56dc61217319')

# Those options need to be consistent between each scons invocation.
_scons_options='max_jobs=1 optimize=1 debug=0 swiften_dll=1'

build() {
  cd $pkgbase-$pkgver
  ./scons $_scons_options Swift Swiften
}

package_swift-im() {
  pkgdesc='XMPP client written in C++ with Qt and Swiften'
  depends=("swiften=$pkgver" 'qt5-base' 'qt5-multimedia' 'qt5-webkit'
           'qt5-x11extras' 'qt5-svg' 'libxss' 'hicolor-icon-theme')

  cd $pkgbase-$pkgver
  ./scons $_scons_options SWIFT_INSTALLDIR="$pkgdir"/usr/ "$pkgdir"/usr/
}

package_swiften() {
  pkgdesc='XMPP library written in C++ with Boost'
  depends=('boost-libs' 'libxml2' 'libidn' 'avahi' 'openssl')

  cd $pkgbase-$pkgver
  ./scons $_scons_options SWIFTEN_INSTALLDIR="$pkgdir"/usr/ "$pkgdir"/usr/
}
