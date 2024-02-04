# Maintainer: Raphaël Slagmolen <tutul at naheulcraft dot be>
pkgname=plymouth-theme-manjaro-charge
pkgver=1.2
pkgrel=1
pkgdesc="A Plymouth theme based on Fedora's Charge theme, but featuring the Manjaro logo and colours."
arch=('any')
url='https://gitlab.com/Tutul/plymouth-theme-manjaro-charge'
license=('GPL')
depends=('plymouth')
install="${pkgname}.install"
backup=('usr/share/plymouth/themes/manjaro-charge/watermark.png')
source=(
    "https://gitlab.com/api/v4/projects/41563279/packages/generic/manjaro-charge/${pkgver}/manjaro-charge-$pkgver.tar.gz"
    "https://gitlab.com/api/v4/projects/41563279/packages/generic/manjaro-charge/${pkgver}/manjaro-charge-$pkgver.tar.gz.sig"
)
sha256sums=(
    '0371758ee66f5173402a2996dc4dce116986da9338fb6bd7611a00883b9ad840'
    'b65caac928d74c82abd4d60e9ecd6ef3b98ad2981dc3253878997c1763c88706'
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
