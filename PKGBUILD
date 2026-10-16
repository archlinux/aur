# Maintainer: Haotian Li <lilinzta@gmail.com>

pkgname=venera-prime-bin
pkgdesc="A comic reader that support reading local and network comics. (Prime)"
pkgver=2.6.1
pkgrel=1
arch=('x86_64')
url="https://github.com/venera-app/venera-prime"
license=('GPL-3.0-only')
depends=('at-spi2-core' 'cairo' 'fontconfig' 'gcc-libs' 'glib2' 'glibc' 'gdk-pixbuf2' 'gtk3' 'harfbuzz' 'libepoxy' 'libsoup3' 'pango' 'webkit2gtk-4.1')
conflicts=('venera' 'venera-bin')
options=('!debug')
source=("${url}/releases/download/v${pkgver}/venera_${pkgver}_amd64.deb")
sha256sums=('d51122d54421eb2c3102477d7073e74b6a995311b7c11d3b7eea86aace037f5f')

package() {
    tar -I zstd -xf data.tar.zst --numeric-owner -C "${pkgdir}/"
    install -dm755 "${pkgdir}/usr/bin"
    cp -R ${pkgdir}/usr/local/lib/venera ${pkgdir}/usr/share/
    rm -rf ${pkgdir}/usr/local/
    sed -i 's|/usr/local/lib/venera/||g' ${pkgdir}/usr/share/applications/venera.desktop
    ln -sf /usr/share/venera/venera "${pkgdir}/usr/bin/"
    chown -R root:root "${pkgdir}"
}
