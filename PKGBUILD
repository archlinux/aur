# Maintainer: Winston Astrachan <winston dot astrachan at gmail dot com>

pkgname=wireguard-vanity-keygen-bin
_shortname=wireguard-vanity-keygen
pkgver=0.0.6
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
sha256sums_x86_64=('22ddcfa71202068d2cec44f044807afe56db1a3684f9f8a45a8ba5db36b58d48')
sha256sums_aarch64=('dcd1077af780ae60def507ff9e39f58d6d99a9e06a3e7712ddbad4ae7bebd455')
sha256sums_i686=('e44665b8036aaf092d1191d3168022f5495f9078533cf9c4c8f9f31d5b47adc5')
sha256sums_arm=('5faf8ee1e8cb2d1151f110be1b10e0b3c9102ae302288f8128c8575eba74029e')

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
