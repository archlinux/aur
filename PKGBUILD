# Maintainer: WhiredPlanck <fungdaat31[at]outlook.com>

pkgname=chinese-calendar-git
pkgver=1.0.3.r59
pkgrel=1
pkgdesc="Chinese traditional calendar for Ubuntu Kylin, available on other DE (This a personal fork)"
arch=('x86_64')
url="https://github.com/whriedplanck/chinese-calendar"
license=('GPL3')
depends=('qt5-base' 'qt5-svg')
#makedepends=('bzr')
makedepends=('bzr')
provides=('chinese-calendar')
conflicts=('chinese-calendar')
# unreleased version has qt5 support and references to 1.0.4 in debian/changelog
#source=("https://launchpad.net/ubuntu/+archive/primary/+files/chinese-calendar_$pkgver.orig.tar.xz")
#source=("bzr+lp:chinese-calendar#revision=58")
source=("chinese-calendar-${pkgver}.tar.gz::https://github.com/whriedplanck/chinese-calendar/archive/${pkgver}.tar.gz")
sha512sums=('SKIP')

build() {
  cd chinese-calendar-${pkgver}
  ln -sf src/datemaskwidget.h datemaskwidget.h
  qmake PREFIX=/usr
        #CONFIG+=release \
        #CONFIG+=force_debug_info \
        #QMAKE_CXXFLAGS+="-fsanitize=address -fno-omit-frame-pointer" \
        #QMAKE_CFLAGS+="-fsanitize=address -fno-omit-frame-pointer" \
        #QMAKE_LFLAGS+="-fsanitize=address"
  make #ver=debug
}

package() {
  cd chinese-calendar-${pkgver}
  make install INSTALL_ROOT="$pkgdir"
}
