## Maintainer: Joshua Snyder <madsciencecoder@gmail.com>
pkgname='virt-manager-qt5'
_pkgname='qt-virt-manager'
pkgbase='virt-manager-qt'
url='https://github.com/F1ash/qt-virt-manager'
makedepends=('cmake')
arch=('i686' 'x86_64')
license=('GPL2')
pkgrel=2
pkgver=0.25.47
source=("git+https://github.com/F1ash/qt-virt-manager.git#tag=$pkgver")
depends+=('qt5-base' 'qt5-svg' 'qtermwidget-git' 'spice-protocol' 'spice-glib' 'libvirt' 'scrub' 'qt5-multimedia' 'hicolor-icon-theme' 'x11-ssh-askpass')
pkgdesc="Qt5 Virtual Machine Manager provides a graphical tool for administering virtual machines for QEMU/KVM, Xen, and LXC and other Virtual Entities.
Uses libvirt as the backend management API."
md5sums=('SKIP')
conflicts=('virt-manager-qt4')
replaces=('virt-manager-qt4')

prepare()
{
    mkdir -p "$srcdir"/$_pkgname/cmake
}
build()
{
    export CXXFLAGS="$CXXFLAGS -std=c++11"
    cd "$srcdir"

    mkdir -p "$srcdir"/build
    cd "$srcdir"/build
    cmake -DBUILD_QT_VERSION=5 \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        ../$_pkgname
    make
}

package()
{
    cd "$srcdir"/build
    make install DESTDIR=$pkgdir
}
