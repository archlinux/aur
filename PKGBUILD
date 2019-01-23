# Maintainer: Bjoern Franke <bjo@nord-west.org>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgbase='swift4-git'
pkgname=('swift4-im-git' 'swiften4-git')
pkgver=4.0.2.r6.gbb3bd8a32
pkgrel=1
arch=('i686' 'x86_64')
url="http://swift.im/"
license=('GPL3')
makedepends=('git' 'python2' 'openssl' 'boost' 'qt5-base' 'qt5-multimedia'
             'qt5-webkit' 'qt5-x11extras' 'qt5-tools' 'qt5-svg')
source=("git://swift.im/swift#branch=swift-4.x")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/swift"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^swift\.//'
}

# Those options need to be consistent between each scons invocation.
_scons_options='max_jobs=1 optimize=1 debug=0 swiften_dll=1'
_directory='swift'

build() {
  cd "$srcdir/$_directory"
  ./scons $_scons_options Swift Swiften
}

package_swift4-im-git() {
  pkgdesc='XMPP client written in C++ with Qt and Swiften (4.x branch)'
  depends=("swiften4-git=$pkgver" 'qt5-base' 'qt5-multimedia' 'qt5-webkit'
           'qt5-x11extras' 'qt5-svg')
  provides=('swift-im=3.0')
  conflicts=('swift-im')

  cd "$srcdir/$_directory"
  ./scons $_scons_options SWIFT_INSTALLDIR="$pkgdir/usr/" "$pkgdir/usr/"
}

package_swiften4-git() {
  pkgdesc='XMPP library written in C++ with Boost (4.x branch)'
  depends=('boost-libs')
  provides=('swiften=4.0')
  conflicts=('swiften')

  cd "$srcdir/$_directory"
  ./scons $_scons_options SWIFTEN_INSTALLDIR="$pkgdir/usr/" "$pkgdir/usr/"
}
