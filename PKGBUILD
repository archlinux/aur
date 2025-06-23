# Maintainer: cookie <coookieuniverse@gmail.com>

pkgname=danser-bin
url="https://github.com/Wieku/danser-go"
pkgver=0.11.0
pkgrel=2
pkgdesc="Dancing visualizer of osu! maps and custom osu! client written in Go."
arch=('x86_64')
license=('GPL3')
conflicts=('danser-git' 'danser')
source=(
    "https://github.com/Wieku/danser-go/releases/download/${pkgver}/danser-${pkgver}-linux.zip"
    "https://raw.githubusercontent.com/Wieku/danser-go/refs/heads/master/LICENSE"
)
sha256sums=(
    'c3184ceb84b20e8e9c9a2709113efc29b8bdf2f866949834d7fb8e799618a67e'
    '5c4704f4d20364d99017de927389eaae10b87f9e6163bf79e652821dbbaaae69'
)
depends=(
    'libyuv'
    'ffmpeg'
    'gtk3'
)

package() {
    cd "${srcdir}"
    mkdir -p "${pkgdir}/usr/lib/danser" "${pkgdir}/usr/bin"

    install -Dm755 libdanser-core.so libbass.so libbass_fx.so libbassmix.so assets.dpak "${pkgdir}/usr/lib/danser"
    install -Dm755 danser "${pkgdir}/usr/lib/danser/danser"
    install -Dm755 danser-cli "${pkgdir}/usr/lib/danser/danser-cli"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    ln -s "/usr/lib/danser/danser" "${pkgdir}/usr/bin/danser"
    ln -s "/usr/lib/danser/danser-cli" "${pkgdir}/usr/bin/danser-cli"
}
