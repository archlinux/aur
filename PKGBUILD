# Maintainer: Amin <fieryrainbow0 at gmail dot com>

pkgname=mc-tlauncher
pkgver=2.8.0
pkgrel=2
epoch=1
pkgdesc="Minecraft TLauncher Client for the AUR <visit tlauncher.org>"
arch=("any")
url="https://www.tlauncher.org"
license=("GPL")
depends=("jre8-openjdk" "unzip") 
makedepends=("imagemagick")

_jar="https://tlauncher.org/jar"
noextract=("jar")

source=( "$_jar" "${pkgname}.desktop" "${pkgname}.png" "${pkgname}")
sha256sums=('95b04ac7b5c2e3b719156c0e2b4b1edcf8c08ddf04afededd4b352dcdbe46d33'
            '8831917db1f83ef128f9e84fdb86116b886be2f7602fc03c17c642949bdd46f5'
            '852fd445fe399114a3a7c9d07779ef2cf691fd674608ae591762ed7ecbe56ebc'
            'ce8f64c074551f966674181a584cb3af4be8d1b8290f2fca1ee9448e01bc07d7')


prepare() {
	unzip -o jar -d "${srcdir}/${pkgname}-extracted/"
	mv "${srcdir}/${pkgname}-extracted/TLauncher-2.8.jar" "${srcdir}/${pkgname}-extracted/tlauncher.jar"
}

package() {
        install -dm755 "${pkgdir}/"{opt,usr/share/applications,usr/bin/}
        cp -rL "${srcdir}/${pkgname}-extracted" "${pkgdir}/opt/${pkgname}"
        install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
        echo ${pkgdir}
        install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
        for _size in "192x192" "128x128" "96x96" "64x64" "48x48" "32x32" "24x24" "22x22" "20x20" "16x16" "8x8"
        do
                install -dm755 "${pkgdir}/usr/share/icons/hicolor/${_size}/apps"
                convert "${srcdir}/${pkgname}.png" -resize "${_size}" "${pkgdir}/usr/share/icons/hicolor/${_size}/apps/${pkgname}.png"
        done
}
