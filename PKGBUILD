# Maintainer: Patrice Peterson <runiq@archlinux.us>

# This package is based on the gog-terraria package and the gog-freedom-planet package from Ainola.

pkgname=gog-torchlight2
_pkgname=gog-torchlight-2
pkgver=2.0.0.1
pkgrel=1
pkgdesc='An action RPG dungeon crawler'
arch=("i686" "x86_64")
url='http://www.gog.com/game/torchlight_ii'
license=('custom:commercial')
groups=('games')
source=("gog://${_pkgname//-/_}_${pkgver}.sh"
        "${pkgname}.desktop"
		"${pkgname}")
sha512sums=('56c47950aebf87886b42e7037801788223ddbf76b124abc61d6eb70ce402435650b7b47aeee1e976fc9fed7150b3dba07d97c4dc2e4034443af3b61f900de5de'
            'f85e8fa535e739f620819998acfb663b7fa7645978c7a5e7f56f16c2f447c1aff0c457b65699e849c101d1d4c93c3221797941621b7882beedf99b8e6eb7228b'
            'c68c5a015bb75ae520d34f0e5f94309462db8ea6159f8a22b3d2842def37800229c6a5c1c37e09ed9c7d570abf8e89340781bb17ed0ad2ae61508b7abd3be97a')

# You need to download the gog.com installer file manually or with lgogdownloader.
DLAGENTS+=("gog::/usr/bin/echo %u - This is is not a real URL, you need to download the GOG file manually to \"$PWD\" or setup a gog:// DLAGENT. Read this PKGBUILD for more information.")

# If you want to use lgogdownloader
# DLAGENTS+=('gogdownloader::/usr/bin/lgogdownloader --download-file=%u -o %o')
# source=("gogdownloader://shovel-knight/en3installer4" "${pkgname}.desktop")

# Prevent compressing final package
PKGEXT='.pkg.tar'

package() {
    cd "$srcdir"
    # Install game
    install -d "${pkgdir}/opt/${pkgname}/"
    install -d "${pkgdir}/opt/${pkgname}/support"
    install -d "${pkgdir}/usr/bin/"
    cp -r "data/noarch/game" "${pkgdir}/opt/${pkgname}/"
    install -Dm755 "data/noarch/start.sh" \
        "${pkgdir}/opt/${pkgname}/"
    install -Dm755 data/noarch/support/*.{sh,shlib} -t \
        "${pkgdir}/opt/${pkgname}/support"

    # Desktop integration
    install -Dm 644 "data/noarch/support/icon.png" \
        "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "data/noarch/docs/End User License Agreement.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm 644 "${srcdir}/${pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm 755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
