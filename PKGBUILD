# Maintainer: Amin <fieryrainbow0 at gmail dot com>

pkgname=mc-tlauncher
pkgver=2.8.0
pkgrel=1
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
            '0033b18785cdd7e98db431d25e428d4946abd1abbcc62382d87c775d9f095795'
            '852fd445fe399114a3a7c9d07779ef2cf691fd674608ae591762ed7ecbe56ebc'
            'd00d402d29b017d105fc1e2c32102f320f0cc02e749de3c46433961f14818b57')


prepare() {
	unzip -o jar -d tlauncher-extracted/
    echo "1"
	mv tlauncher-extracted/TLauncher-2.8.jar tlauncher-extracted/tlauncher.jar
    echo "2"
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
