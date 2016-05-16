# Maintainer :/dev/rs0 <rs0@secretco.de.com>

pkgname=springseed
pkgver=2.0
pkgrel=6
pkgdesc="Simply awesome note taking."

arch=('arm' 'i686' 'x86_64')
license=('MIT')
url="http://getspringseed.com"

depends=('electron<=0.37.8')
source=(
    "http://assets.apertron.net/springseed.zip"
    "springseed" "springseed.svg" "springseed.desktop")
sha256sums=(
    'e6a47b92e27e2f4ec4192e49f3c15b50a13067a1a855b59dc8744e1eae7caa90'
    '40b9145712d23a6c0acc5369d56769844d162496dc91689e09c55b2ab7be80ae'
    'bad6f3233653fed2041fdad1bf8f67adc3f849b069c5f200239b435eed005c07'
    'd2a249a140075f887bf8841ebc58e89e5ceefaa98c355857a6a3a3bc108a4847')

package() {
    install -d "${pkgdir}/usr/share/springseed"
    cp -a "${srcdir}/springbuild/app/." "${pkgdir}/usr/share/springseed"
    find "${pkgdir}" -type d -exec chmod 755 {} +
    find "${pkgdir}" -type f -exec chmod 644 {} +

    install -Dm644 "${pkgdir}/usr/share/springseed/LICENSE" "${pkgdir}/usr/share/licenses/springseed/LICENSE"
    rm "${pkgdir}/usr/share/springseed/LICENSE"

    install -Dm644 "${srcdir}/springseed.desktop" "${pkgdir}/usr/share/applications/springseed.desktop"
    install -Dm644 "${srcdir}/springseed.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/springseed.svg"
    install -Dm755 "${srcdir}/springseed" "${pkgdir}/usr/share/springseed/springseed"

    install -d "${pkgdir}/usr/bin"
    ln -s "/usr/share/springseed/springseed" "${pkgdir}/usr/bin/springseed"
}
