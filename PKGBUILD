# Maintainer: Jacques Fontaine <waitnsea@free.fr>
# Contributor: Ryan Young <ryan31415926535@gmail.com>
pkgname=linssid
pkgver=2.7
pkgrel=2
pkgdesc="A graphical wireless scanner for Linux"
arch=(i686 x86_64)
url="http://sourceforge.net/projects/linssid/"
license=('GPL3')
depends=(qt5-base qt5-svg libxkbcommon-x11 iw wireless_tools)
makedepends=(boost)
optdepends=('sudo: privilege escalation to use wireless tools')
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}_$pkgver.orig.tar.gz")
md5sums=('084ae391bb7e104421fa626a082e1db7')
prepare() {
        cd "$srcdir/$pkgname-$pkgver"
        # build workarounds, credit 'czerwonyd'
        sed -i -e 's/QT_STATIC_CONST/static const/g' qwt-lib/src/qwt_transform.h
        sed -i -e 's/QT_STATIC_CONST_IMPL/const/g' qwt-lib/src/qwt_transform.cpp
  
}
build() {
        cd "$srcdir/$pkgname-$pkgver"
        qmake-qt5
        make
}

package() {
        cd "$srcdir/$pkgname-$pkgver"
        make INSTALL_ROOT="$pkgdir/" install
}
 
