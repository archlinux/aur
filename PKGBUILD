# Contributor: sxe <sxxe@gmx.de>
pkgname=qlipper
pkgver=2.0.2
pkgrel=3
pkgdesc="Lightweight & cross-platform clipboard history applet based on qt"
arch=('i686' 'x86_64')
url="https://github.com/pvanek/qlipper/"
license=("GPL")
depends=('qt4' 'libqxt')
makedepends=('cmake')
source=("https://github.com/pvanek/qlipper/archive/$pkgver.tar.gz")

md5sums=('29c8c7b4a4b08ce127b224d21b7a00d4')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    #qmake
    msg "Starting build process."
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DUSE_SYSTEM_QTSA=0 -DCMAKE_BUILD_TYPE=Release -DQT_QMAKE_EXECUTABLE=qmake-qt4
    make
}

package() {
    msg2 "Starting packaging."
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
    install -D -m755 qlipper $pkgdir/usr/bin/qlipper
    install -Dm644 $srcdir/qlipper-$pkgver/qlipper.desktop $pkgdir/usr/share/applications/qlipper.desktop
}
