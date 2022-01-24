# Maintainer: Winston Astrachan <winston dot astrachan at gmail dot com>

pkgname=wireguard-vanity-keygen-bin
_shortname=wireguard-vanity-keygen
pkgver=0.0.3
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
sha256sums_x86_64=('6f11f7b8b931154752b71937887d533606d2bfcc40ec6d0c0e8f6b7ce492986e')
sha256sums_aarch64=('366bea899f6a45d97af2e8714f56b0f3bbcd576116f7429bb2a415cc31c75619')
sha256sums_i686=('b035a606928a4817cfcd2642d25a0803e7128071991942a08ceb6f3a47525f6f')
sha256sums_arm=('21faaa788a5c9d59769fb46df2d90d6f8baac9ddf570a221a5b7884e366f05c6')

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
