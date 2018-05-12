# Maintainer: Michael Hansen <zrax0111 gmail com>

pkgname=gsshvnc
pkgver="0.92"
pkgrel=1
pkgdesc="A simple VNC client with built-in SSH forwarding"
arch=('i386' 'x86_64')
url="https://github.com/zrax/gsshvnc"
license=('GPL2')
depends=('gtkmm3' 'gtk-vnc' 'libssh')
source=("https://github.com/zrax/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('75d085781ff5b61cac1702d619344aa127afdf9eb5487b851e1a4992a99bc5a3')

build() {
    mkdir build
    cd build

    # Fix GCC8 warnings that break gtk/gtkmm headers
    export CXXFLAGS="$CXXFLAGS -Wno-cast-function-type -Wno-parentheses"

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
