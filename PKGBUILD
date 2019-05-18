# Maintainer: barsoosayque <shtoshich@gmail.com>

pkgname=lib32-libxxf86misc
pkgver=1.0.4
pkgrel=1
pkgdesc="X11 XFree86 misc extension library (32-bit)"
arch=('x86_64')
license=('custom')
url="https://xorg.freedesktop.org/"
depends=('lib32-libxext')
makedepends=('xorg-util-macros' 'gcc-multilib')
source=(${url}/releases/individual/lib/libXxf86misc-${pkgver}.tar.gz)
sha512sums=('34309e581988eed3417922bd703568873566e170195ad52a89dad70b055101cb254732ecef81ecd2109c6f7529638c00a09b38db1b3b34a84ed8863a2ee5fd2d')

build() {
    export CC="gcc -m32"
    export CXX="g++ -m32"
    export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

    cd "${srcdir}/libXxf86misc-${pkgver}"
    ./configure --prefix=/usr --disable-static --libdir=/usr/lib32
    make
}

package() {
    cd "${srcdir}/libXxf86misc-${pkgver}"

    make DESTDIR="${pkgdir}" install
    install -Dm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
