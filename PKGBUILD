# Maintainer: Michael Hansen <zrax0111 gmail com>

pkgname=gsshvnc
pkgver="0.96"
pkgrel=1
pkgdesc="A simple VNC client with built-in SSH tunneling"
arch=('x86_64')
url="https://github.com/zrax/gsshvnc"
license=('GPL-2.0-or-later')
depends=('gtkmm3' 'gtk-vnc' 'libssh')
makedepends=('meson')
source=("https://github.com/zrax/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('fcccd9200d21be73ef9d3de3dac061cde3c740d1e43359603e9e45679f029084')

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
