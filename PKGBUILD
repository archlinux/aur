# Maintainer: Winston Astrachan <winston dot astrachan at gmail dot com>

pkgname=wireguard-vanity-keygen-bin
_shortname=wireguard-vanity-keygen
pkgver=0.0.5
pkgrel=1
pkgdesc='WireGuard vanity key generator'
arch=('x86_64' 'aarch64' 'i686' 'arm')
url='https://github.com/axllent/wireguard-vanity-keygen'
license=('custom')
depends=('glibc')
provides=('wireguard-vanity-keygen')
conflicts=('wireguard-vanity-keygen')
source=("https://raw.githubusercontent.com/axllent/wireguard-vanity-keygen/${pkgver}/LICENSE")
source_x86_64=("https://github.com/axllent/wireguard-vanity-keygen/releases/download/${pkgver}/${_shortname}_${pkgver}_linux_amd64.bz2")
source_aarch64=("https://github.com/axllent/wireguard-vanity-keygen/releases/download/${pkgver}/${_shortname}_${pkgver}_linux_arm64.bz2")
source_i686=("https://github.com/axllent/wireguard-vanity-keygen/releases/download/${pkgver}/${_shortname}_${pkgver}_linux_386.bz2")
source_arm=("https://github.com/axllent/wireguard-vanity-keygen/releases/download/${pkgver}/${_shortname}_${pkgver}_linux_arm.bz2")
sha256sums=('2cb653ca639b18430adce010d0e294db83c120c83fa32d13ea1abb17cca98c32')
sha256sums_x86_64=('3b90b40f70ee73b4e615225e093e27c948045707adf0d9e5af164cdf335aa501')
sha256sums_aarch64=('224c8c8f86a9ba30e324cbe394e63c08786a79d78b9da7b3595172e524a292e5')
sha256sums_i686=('0789980e62da4985ebdcd19122747ece6bd62fd60f286a16b9357a52aa5b7739')
sha256sums_arm=('449cfd76b233f9c679e4b874b3864d32fab359f36aa95cae718458dd8a40a2a7')

package() {
    # Upstream uses different format for architechture notation
    case $CARCH in
        'x86_64')   subarch='amd64' ;;
        'aarch64')  subarch='arm64' ;;
        'i686')     subarch='386'   ;;
        *)          subarch=$CARCH  ;;
    esac

    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 "${srcdir}/${_shortname}_${pkgver}_linux_${subarch}" "${pkgdir}/usr/bin/${_shortname}"
}
