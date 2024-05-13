pkgname=krdp-git
pkgver=r201.08daacf
pkgrel=1
pkgdesc="Library and examples for creating an RDP server."
arch=('x86_64')
url="https://invent.kde.org/plasma/krdp"
license=('LGPL')
source=(git+https://invent.kde.org/plasma/krdp.git)
sha256sums=('SKIP')
provides=('krdp')
conflicts=('krdp')
depends=(kcmutils qt6-base freerdp2 kstatusnotifieritem kpipewire qtkeychain-qt6)
makedepends=(extra-cmake-modules git plasma-wayland-protocols)

pkgver() {
    cd $srcdir/krdp
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd $srcdir/krdp
    mkdir build && cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr ..
    make
}

package() {
    cd $srcdir/krdp/build
    make DESTDIR=$pkgdir install
}
