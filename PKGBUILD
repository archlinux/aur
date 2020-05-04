pkgname=aqemu-git
pkgver=v0.9.2.r101.g34ca8ce
pkgrel=1
pkgdesc="QEMU GUI written in Qt (Qt5 rewrite)"
arch=('i686' 'x86_64')
url="https://github.com/tobimensch/aqemu"
license=('GPL2')
conflicts=("aqemu")
depends=('qemu' 'qt5-base' 'libvncserver')
makedepends=('meson' 'ninja' 'qt5-base')
source=("aqemu::git+https://github.com/tobimensch/aqemu.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/aqemu"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/aqemu"
    mkdir builddir
    cd builddir
    meson --prefix=/usr/ --sysconfdir=/etc
    ninja
}

  package() {
    cd "$srcdir/aqemu/builddir"
    DESTDIR="$pkgdir" ninja install
}
