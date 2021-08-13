# Maintainer: Michael Hansen <zrax0111 gmail com>

pkgname=gsshvnc
pkgver="0.95"
pkgrel=1
pkgdesc="A simple VNC client with built-in SSH tunneling"
arch=('x86_64')
url="https://github.com/zrax/gsshvnc"
license=('GPL2')
depends=('gtkmm3' 'gtk-vnc' 'libssh')
makedepends=('meson')
source=("https://github.com/zrax/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('5de4c3f3f771fab96d29063f8b0418271e7294ff093ababee8d88c81087dfa35')

build() {
    arch-meson "${pkgname}-${pkgver}" build
    meson compile -C build
}

package() {
    DESTDIR="$pkgdir" meson install -C build

    install -d -m755 "${pkgdir}/usr/share/licenses/gsshvnc"
    install -m644 "${srcdir}/${pkgname}-${pkgver}/COPYING" \
        "${pkgdir}/usr/share/licenses/gsshvnc/"
}
