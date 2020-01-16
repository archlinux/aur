# Maintainer: Alisson Lauffer <alissonvitortc@gmail.com>
# Contributor: AwesomeHaircut <jesusbalbastro@gmail.com>
# Contributor: Lari Tikkanen <lartza@outlook.com>

pkgname=feedthebeast
pkgver=1.5.0
pkgrel=2
pkgdesc="Feed The Beast offers many different styles of Minecraft modpacks to the community, catering to all tastes."
arch=('any')
url='https://feed-the-beast.com/'
license=('Apache')
# libzip is needed for many modpacks.
depends=('java-runtime=8' 'hicolor-icon-theme' 'xorg-xrandr' 'ttf-dejavu' 'libzip')
makedepends=('libicns')
source=("$pkgname"
	"${pkgname}-$pkgver.jar"::"https://dist.creeper.host/FTB2/launcher/FTB_Launcher.jar"
        "${pkgname}.desktop")
noextract=("${pkgname}-$pkgver.jar")
sha256sums=('0da942aa85086a6caebd497a31ea882e8259ad0e6989323926f9e32c2563d80f'
            '47d6ce99fc052d12b587beaa11b94441336b8190525b30a9e45ee4622d2d6b50'
            '9b1af045ee5c08237a64cdc8b4331f6cd18a054688ae44789bb456c708bbf7a7')

package() {
    install -Dm755 "$pkgname" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${pkgname}-$pkgver.jar" "${pkgdir}/usr/share/${pkgname}/${pkgname}.jar"
    install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # icons are trapped inside .icns format, free them.
    bsdtar -xf "${pkgname}-$pkgver.jar" app/icon.icns
    icns2png -x app/icon.icns
    for size in 16 32 48 128 256; do
        install -Dm644 "icon_${size}x${size}x32.png" \
          "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/${pkgname}.png"
    done
}
