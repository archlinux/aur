# Maintainer: Cranky Supertoon <crankysupertoon@gmail.com>
# Contributor: Alisson Lauffer <alissonvitortc@gmail.com>
# Contributor: AwesomeHaircut <jesusbalbastro@gmail.com>
# Contributor: Lari Tikkanen <lartza@outlook.com>

pkgname=feedthebeast-classic
_pkgname=feedthebeast
pkgver=1.5.1
pkgrel=3
pkgdesc="Feed The Beast offers many different styles of Minecraft modpacks to the community, catering to all tastes."
arch=('any')
url='https://feed-the-beast.com/'
license=('Apache')
# libzip is needed for many modpacks.
depends=('java-runtime=8' 'hicolor-icon-theme' 'xorg-xrandr' 'ttf-dejavu' 'libzip')
makedepends=('gendesk')
source=("$pkgname"
	"${_pkgname}-$pkgver.jar"::"https://dist.creeper.host/FTB2/launcher/FTB_Launcher.jar")
noextract=("${_pkgname}-$pkgver.jar")
sha256sums=('SKIP'
            'SKIP')

prepare() {
    # generate .desktop
    gendesk --pkgname "Feed The Beast Classic" --pkgdesc "${pkgdesc}" --icon ${pkgname} --exec "/usr/bin/${pkgname}" -n -f
    mv "Feed The Beast Classic.desktop" "${pkgname}.desktop"
}

package() {
    install -Dm755 "$pkgname" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${_pkgname}-$pkgver.jar" "${pkgdir}/usr/share/${_pkgname}/${_pkgname}.jar"
    install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    bsdtar -xf "${_pkgname}-$pkgver.jar" image/logo_ftb_large.png
    install -d -m755 "${pkgdir}/usr/share/icons/hicolor"
    cp -Rr "${srcdir}/image/logo_ftb_large.png" "${pkgdir}/usr/share/icons/${pkgname}.png"
}
