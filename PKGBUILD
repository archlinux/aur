# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=moneydance-bin
pkgver=2023.1
pkgrel=1
pkgdesc="An easy to use and full-featured personal finance app that doesn't compromise your privacy. "
arch=('x86_64')
url="http://moneydance.com/"
license=('custom')
provides=()
conflicts=("${pkgname%-bin}")
depends=('freetype2' 'sh' 'zlib' 'libxtst' 'gdk-pixbuf2' 'libxrender' 'libglvnd' 'libxi' 'java-runtime' 'gtk2' \
    'hicolor-icon-theme' 'libxext' 'libx11' 'cairo' 'glibc' 'glib2' 'pango' 'gtk3' 'alsa-lib')
options=()
source=("${pkgname%-bin}-${pkgver}.deb::https://infinitekind.com/stabledl/current/${pkgname%-bin}_linux_amd64.deb")
sha256sums=('abe15c7a10576cfeca5283f5ba30a9164c70ad4653928912675a65cd0748d208')
package() {
    bsdtar -xf data.tar.bz2 -C "${pkgdir}"
    install -Dm644 "${pkgdir}/opt/Moneydance/resources/license.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    cat <<EOF > "${srcdir}/${pkgname%-bin}.desktop"
[Desktop Entry]
Name=Moneydance
Comment=Powerful, private, personal finance software
Exec="/opt/Moneydance/Moneydance"
Terminal=false
Type=Application
Icon=${pkgname%-bin}
Categories=Office;Finance
StartupWMClass=moneydance
Keywords=money,budget,budgeting,finance,finances,accounting,investing,investment,stocks,exchangerates,prices,quicken
EOF
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 32x32 128x128 512x512;do
        install -Dm644 "${pkgdir}/opt/Moneydance/resources/${pkgname%-bin}_icon${_icons/x*}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
}