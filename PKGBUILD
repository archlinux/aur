# Maintainer: Michael Hansen <zrax0111 gmail com>

pkgname=gsshvnc
pkgver="0.93"
pkgrel=1
pkgdesc="A simple VNC client with built-in SSH forwarding"
arch=('i386' 'x86_64')
url="https://github.com/zrax/gsshvnc"
license=('GPL2')
depends=('gtkmm3' 'gtk-vnc' 'libssh')
source=("https://github.com/zrax/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('80ce380a71ef9bd0ff8e5e2de73abecb0cdd4599d509b750602ebaa3fc53d62a')

build() {
    mkdir build
    cd build

    cmake "${srcdir}/${pkgname}-${pkgver}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr

    make
}

package() {
    cd build

    make DESTDIR="${pkgdir}/" install

    install -d -m755 "${pkgdir}/usr/share/licenses/gsshvnc"
    install -m644 "${srcdir}/${pkgname}-${pkgver}/COPYING" \
        "${pkgdir}/usr/share/licenses/gsshvnc/"
}
