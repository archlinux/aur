# Maintainer: skydrome <skydrome@i2pmail.org>
# Contributor: skydrome <skydrome@i2pmail.org>

pkgname=acquisition-plus
pkgver=0.3c
pkgrel=1
pkgdesc="Inventory management tool for Path of Exile"
url="https://github.com/Novynn/acquisitionplus"
license=('GPL2')
arch=('i686' 'x86_64')
depends=('qt5-base' 'libxkbcommon-x11' 'hicolor-icon-theme' 'desktop-file-utils')
install='acquisition.install'

source=("https://github.com/Novynn/acquisitionplus/archive/${pkgver}-PLUS.tar.gz"
        "acquisition.desktop")

sha256sums=('6e29752d93cdb9253b1a380bdaa8331b324f8f72babb29c1f12a32bcd1464aeb'
            '556e8a764ecaf9ac4b9b7f6b6340c7bff7aae9c1b179fc0601d93886bc810e81')

prepare() {
    cd "$srcdir/acquisitionplus-${pkgver}-PLUS"

    qmake
    sed -i Makefile \
        -e "s:CC .*=.*:CC = $CC:" \
        -e "s:CXX .*=.*:CXX = $CXX:" \
        -e "s:CFLAGS .*=.*:CFLAGS = $CFLAGS -D_REENTRANT -fPIC -std=c++11 \$(DEFINES):" \
        -e "s:CXXFLAGS .*=.*:CXXFLAGS = $CXXFLAGS -D_REENTRANT -fPIC -std=c++11 \$(DEFINES):" \
        -e "s:LFLAGS .*=.*:LFLAGS = $LDFLAGS:"
}

build() {
    cd "$srcdir/acquisitionplus-${pkgver}-PLUS"
    make
}

package() {
    cd "$srcdir/acquisitionplus-${pkgver}-PLUS"

    install -Dm755 acquisitionplus "$pkgdir/usr/bin/acquisitionplus"
    install -Dm644 assets/icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/acquisitionplus.svg"
    install -Dm644 ../acquisition.desktop "$pkgdir/usr/share/applications/acquisitionplus.desktop"
}
