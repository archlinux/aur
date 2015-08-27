# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgbase='swift'
pkgname=('swift' 'swiften')
pkgver=3.0beta2
pkgrel=1
arch=('i686' 'x86_64')
url="http://swift.im/"
license=('GPL3')
makedepends=('python2' 'openssl' 'qt5-base' 'boost')
source=("http://swift.im/downloads/releases/$pkgbase-$pkgver/$pkgbase-$pkgver.tar.gz")
md5sums=('SKIP')

# Those options need to be consistent between each scons invocation.
_scons_options='qt5=1 max_jobs=1 optimize=1 debug=0 swiften_dll=1 cxxflags="-DBOOST_SIGNALS_NO_DEPRECATION_WARNING=1"'

build() {
  cd "$srcdir/$pkgbase-$pkgver"
  ./scons $_scons_options Swift Swiften
}

check() {
  cd "$srcdir/$pkgbase-$pkgver"
  ./scons $_scons_options test=unit
}

package_swift() {
  pkgdesc='XMPP client written in C++ with Qt'
  depends=("swiften=$pkgver" 'qt5-base' 'qt5-multimedia' 'qt5-webkit' 'qt5-x11extras')

  cd "$srcdir/$pkgbase-$pkgver"
  ./scons $_scons_options SWIFT_INSTALLDIR="$pkgdir/usr/" "$pkgdir/usr/"
}

package_swiften() {
  pkgdesc='XMPP library written in C++ with Boost'
  depends=('boost-libs')

  cd "$srcdir/$pkgbase-$pkgver"
  ./scons $_scons_options SWIFTEN_INSTALLDIR="$pkgdir/usr/" "$pkgdir/usr/"
}
