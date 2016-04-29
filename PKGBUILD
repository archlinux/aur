pkgname=aqemu-git
pkgver=v0.9.0.r47.gf120698
pkgrel=1
pkgdesc="QEMU GUI written in Qt (Qt5 rewrite)"
arch=('i686' 'x86_64')
url="https://github.com/tobimensch/aqemu"
license=('GPL2')
conflicts=("aqemu")
depends=('qemu' 'qt5-base' 'libvncserver')
makedepends=('cmake' 'qt5-base')
source=("aqemu::git+https://github.com/tobimensch/aqemu.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/aqemu"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/aqemu"
    cmake -DCMAKE_INSTALL_PREFIX=/usr/ -DQT_QMAKE_EXECUTABLE=qmake4
    make
}

  package() {
    cd "$srcdir/aqemu"
    touch "$srcdir/aqemu/aqemu.1" # man page is removed, but still expected by build system - will be removed soon
    make DESTDIR="$pkgdir" install
}
