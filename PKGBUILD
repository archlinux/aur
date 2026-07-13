# Maintainer: Tandang Pangestu <jpangestu111@gmail.com>
pkgname=nordplayer-bin
pkgver=0.1.21.alpha
_realver=0.1.21-alpha # The actual upstream package version
pkgrel=1
pkgdesc="A highly customizable music player with extensive theming"
arch=('x86_64')
url="https://github.com/jpangestu/nordplayer"
license=('MIT')
depends=('gtk3' 'glibc' 'mpv' 'ffmpeg' 'chromaprint')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")

source=("${pkgname%-bin}-${_realver}-linux-x86_64.tar.gz::${url}/releases/download/v${_realver}/nordplayer-v${_realver}-linux-x86_64.tar.gz"
        "nordplayer.desktop"
        "LICENSE-${_realver}::https://raw.githubusercontent.com/jpangestu/nordplayer/v${_realver}/LICENSE")

sha256sums=('4db6c5fb97a06fd234941724f5854b1f057804897051f40c7ca9d0681b2a38e6'
            'ecd8609d688e1289b771630d448ae2784d86f4ffaac6664c60f3bbe8c1dec99e'
            'd2d008fce1bf600da89fa17ca86a1beb8abb3f3a54121494684035dbf275d9cb')

package() {
    install -dm755 "$pkgdir/opt/nordplayer"
    cp -a "$srcdir/bundle"/{data,lib,nordplayer} "$pkgdir/opt/nordplayer/"

    # Create symlink
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/nordplayer/nordplayer" "${pkgdir}/usr/bin/nordplayer"

    # Install the .desktop, icon, and license
    install -Dm644 "${srcdir}/nordplayer.desktop" "${pkgdir}/usr/share/applications/nordplayer.desktop"
    install -Dm644 "${srcdir}/bundle/data/flutter_assets/assets/icons/nordplayer_logo.svg" "${pkgdir}/usr/share/pixmaps/nordplayer.svg"
    install -Dm644 "${srcdir}/LICENSE-${_realver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
