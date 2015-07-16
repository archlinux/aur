# Maintainer: Chad "crossroads1112" Sharp <crossroads1112@riseup.net>
pkgname=insight-fm
pkgver=0.8.5
pkgrel=1
my_pkgrel=Release
pkgfullname="lumina-${pkgver}-${my_pkgrel}"
pkgdesc="The Lumina Desktop Environment's file manager"
arch=('x86_64' 'i686')
url="https://github.com/pcbsd/lumina"
license=('BSD')
depends=('qt5-base' 'qt5-multimedia' 'qt5-x11extras' 'oxygen' 'oxygen-icons' 'desktop-file-utils' 'qtchooser')
makedepends=('qt5-tools' 'qt5-base')
conflicts=("lumina-de-git" "lumina-desktop" "lumina-desktop-git")
provides=("insight-fm")
source=("https://github.com/pcbsd/lumina/archive/v${pkgver}-${my_pkgrel}.tar.gz")
md5sums=('33a39510a1964baf12b32c14a6d80b41')


build(){
    cd $srcdir/${pkgfullname}
    $srcdir/${pkgfullname}/libLumina/make-linux-distro.sh Debian
    for i in lumina-config lumina-desktop lumina-screenshot lumina-xconfig lumina-info; do 
        sed -i "/$i/d" ./lumina.pro
    done
    find $srcdir/${pkgfullname} -name *.desktop -exec sed -i 's/usr\/local/usr/' {} \;
    qmake PREFIX="/usr" QT5LIBDIR=/usr/lib/qt
    make
}

package() {
    cd $srcdir/"${pkgfullname}"
    make INSTALL_ROOT="${pkgdir}" install
}
