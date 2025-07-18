# Maintainer: Raphaël Slagmolen <tutul at naheulcraft dot be>
pkgname=plymouth-theme-manjaro-charge
pkgver=1.3
pkgrel=1
pkgdesc="A Plymouth theme based on Fedora's Charge theme, but featuring the Manjaro logo and colours."
arch=('any')
url='https://gitlab.com/Tutul/plymouth-theme-manjaro-charge'
license=('GPL-2.0-or-later')
depends=('plymouth')
install="${pkgname}.install"
backup=('usr/share/plymouth/themes/manjaro-charge/watermark.png')
source=(
    "https://gitlab.com/api/v4/projects/41563279/packages/generic/manjaro-charge/${pkgver}/manjaro-charge-$pkgver.tar.gz"
    "https://gitlab.com/api/v4/projects/41563279/packages/generic/manjaro-charge/${pkgver}/manjaro-charge-$pkgver.tar.gz.sig"
    "${pkgname}.install"
)
sha256sums=(
    '39bfda8b04ba0d48c46fd0362a770673f6dd2c373b75aba227dcaca64f2773b6'
    '55016dea33d99beebbeb8a2aabb6d5247a282898260693a4bd5a29c00e3033d2'
    'f56b80142c08e00567dde960debb7ee12b2d6c278ec990ab90b0b3f5affafe7c'
)
validpgpkeys=('C955966427F01F02C4D759EE7CB0421A6A813246')

# Let you customize with one of the graphical environment logo provided
_selectedwatermark='default'
_providedwatermark=('default' 'budgie' 'cinnamon' 'gnome' 'i3' 'mate' 'plasma' 'sway' 'xfce')

prepare() {
    if [[ ! "${_providedwatermark[*]}" =~ "${_selectedwatermark}" ]]; then
        echo "The requested watermark (${_selectedwatermark}) isn't supported by this package"
        _selectedwatermark='default'
    fi
    cd "${srcdir}/manjaro-charge"
    ln -sf watermark-${_selectedwatermark}.png watermark.png
}

package() {
    cd "${srcdir}/manjaro-charge"
    mkdir -p "${pkgdir}/usr/share/plymouth/themes/manjaro-charge"
    install -Dm644 * "${pkgdir}/usr/share/plymouth/themes/manjaro-charge"
}
