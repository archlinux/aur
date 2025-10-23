# Maintainer: Haotian Li <lilinzta@gmail.com>
# Maintainer: taotieren <admin@taotieren.com>

pkgname=venera-bin
pkgdesc="A comic reader that support reading local and network comics."
pkgver=1.5.3
pkgrel=3
arch=('x86_64')
url="https://github.com/venera-app/venera"
license=('GPL-3.0-only')
depends=('at-spi2-core' 'cairo' 'fontconfig' 'gcc-libs' 'glib2' 'glibc' 'gdk-pixbuf2' 'gtk3' 'harfbuzz' 'libepoxy' 'libsoup3' 'pango' 'webkit2gtk-4.1')
conflicts=('venera')
source=("${url}/releases/download/v${pkgver}/venera_${pkgver}_amd64.deb")
sha256sums=('551b30c260755518568140c17e1f18a855adde638459b93a27ad049fb7b79975')

package() {
    tar -I zstd -xf data.tar.zst --numeric-owner -C "${pkgdir}/"
    install -dm755 "${pkgdir}/usr/bin"
    cp -R ${pkgdir}/usr/local/lib/venera ${pkgdir}/usr/share/
    rm -rf ${pkgdir}/usr/local/
    sed -i 's|/usr/local/lib/venera/||g' ${pkgdir}/usr/share/applications/venera.desktop
    ln -sf /usr/share/venera/venera "${pkgdir}/usr/bin/"
    chown -R root:root "${pkgdir}"
}
