# Maintainer: Ronald van Haren <ronald.archlinux.org>
# Contributor : Damir Perisa <damir.perisa@bluewin.ch>

pkgname=celestia
pkgver=1.6.2.2
pkgrel=1
pkgdesc="Real-time space simulation"
arch=('x86_64')
license=('GPL')
url="https://celestia.space/"
depends=('gtk2' 'libtheora' 'lua53' 'gtkglext' 'glut' 'libxmu' 'glu' 'libjpeg' 'mesa')
options=('!makeflags')
source=("https://github.com/CelestiaProject/Celestia/archive/$pkgver/$pkgname-$pkgver.tar.gz"
         celestia-fix-desktop.patch::"https://github.com/CelestiaProject/Celestia/commit/6a4a0573.patch")
sha1sums=('6e2fb4481dd69a5a81e31dc4352f2cf3680740d8'
          '23d8963cceb407ff33171f87f8aa1ba5fa8839f9')

prepare() {
    cd Celestia-${pkgver}
    patch -p1 < ../celestia-fix-desktop.patch # Fix executable name in desktop file
    autoreconf -vi
}

build() {
    cd Celestia-${pkgver}
    ./configure --prefix=/usr \
                --with-lua=/usr \
                --datadir=/usr/share \
                --with-gtk \
                --disable-rpath \
                --with-lua
    make
}

package() {
    cd Celestia-${pkgver}

    make DESTDIR="${pkgdir}" MKDIR_P='mkdir -p' install
}

