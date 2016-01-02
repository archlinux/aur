# Maintainer: Sascha Pfau
pkgname=kfritz
pkgver=0.0.14
pkgrel=1
pkgdesc="A KDE program for users of AVMs Fritz!Box to get call signaling and other functions."
arch=(i686 x86_64)
url="https://github.com/jowi24/kfritz"
license=('GPL2')
depends=('kdebase-runtime' 'boost-libs')
makedepends=('automoc4' 'cmake' 'commoncpp2')
source=("https://github.com/jowi24/kfritz/releases/download/${pkgver}/kfritz_${pkgver}.orig.tar.gz")
md5sums=('4f38bb545e5b1469215d261ad41e90e2')


build() {
    cd $srcdir/kfritz

    #run cmake manually to set the correct CMAKE_INSTALL_PREFIX
    mkdir -p build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr ..
    cd ..
    LDFLAGS=""
    make || return 1
}


package() {
    cd $srcdir/kfritz/build
    make DESTDIR=$pkgdir install || return 1

    install -D -m644 $srcdir/kfritz/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
}