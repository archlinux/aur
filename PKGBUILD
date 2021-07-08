# Maintainer: Alexey Andreyev <aa13q@ya.ru>

pkgname=qt5-multimedia-mdk-plugin
pkgver=0.1
pkgrel=1
pkgdesc="Qt multimedia plugins implemented on top of libmdk"
arch=('i686' 'x86_64')
url="https://github.com/wang-bin/qtmultimedia-plugins-mdk"
license=('MIT')
depends=('qt5-multimedia' 'libc++')
makedepends=('sed')
source=(https://github.com/wang-bin/qtmultimedia-plugins-mdk/archive/master.zip
        https://netactuate.dl.sourceforge.net/project/mdk-sdk/nightly/mdk-sdk-linux.tar.xz)
md5sums=('SKIP' 'SKIP')


build() {
   cd $srcdir/qtmultimedia-plugins-mdk-master
   lrelease-qt5 mdkmediaservice.pro
   sed -i 's/MDK_SDK = $$PWD\/mdk-sdk/MDK_SDK = $$PWD\/..\/mdk-sdk/g' mdkmediaservice.pro
   qmake-qt5 MDK_SDK="$$PWD/../mdk-sdk" QMAKE_CFLAGS_RELEASE="$CPPFLAGS $CFLAGS" QMAKE_CXXFLAGS_RELEASE="$CPPFLAGS $CXXFLAGS" QMAKE_LFLAGS_RELEASE="$LDFLAGS" PREFIX=/usr
   make
}

package() {
   cd $srcdir/qtmultimedia-plugins-mdk-master
   make INSTALL_ROOT=$pkgdir install
}
