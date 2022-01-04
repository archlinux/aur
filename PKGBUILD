# Maintainer: Winston Astrachan <winston dot astrachan at gmail dot com>

pkgname=wireguard-vanity-keygen-bin
_shortname=wireguard-vanity-keygen
pkgver=0.0.2
pkgrel=2
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
sha256sums_x86_64=('3c89bc814104a54736eb178b063cdcd28fbcd6b59171eea97a51abfb191fed4a')
sha256sums_aarch64=('1986d7a51117c7f24bc4cb86bd3a6e3027709557f9386dee75198dd24e742f57')
sha256sums_i686=('812a15ef3bdb29c310a756beaf48c21edd0fd32ef2f68f7fc7db3f439c1a13d1')
sha256sums_arm=('3821ba18b63307c5df96a1cb5cde3a6a0509c89fcaff818207b2df3fe3f3c9d6')

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
