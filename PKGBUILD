# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgbase='swift'
pkgname=('swift-im' 'swiften')
pkgver=4.0.2
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc='XMPP client written in C++ with Qt and Swiften'
url="http://swift.im/"
license=('GPL3')
makedepends=('python2' 'openssl' 'boost' 'qt5-base' 'qt5-multimedia'
             'qt5-webkit' 'qt5-x11extras' 'qt5-tools' 'qt5-svg')
source=("http://swift.im/downloads/releases/$pkgbase-$pkgver/$pkgbase-$pkgver.tar.gz")
sha256sums=('1c7c9fb981ecb9b589890c36523dbbabde2f0a708f71a66eb71e9526bf8e0a70')

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
