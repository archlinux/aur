# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=prismlauncher-ore-ui-themes
pkgver=1.0
pkgrel=1
pkgdesc="Minecraft Bedrock-inspired Ore UI theme and icon pack for Prism Launcher"
arch=('any')
url="https://github.com/ninsent/Ore-UI-theme-pack"
license=('MIT')
optdepends=('prismlauncher: the launcher these themes are for')
install=ore-ui.install
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('9294c7a9ec160cbcaaa7a26998d4df42b28a1b73055bdbc64bc6ffa059d5f9cb')

latestver() {
    curl -fsSL "https://api.github.com/repos/ninsent/Ore-UI-theme-pack/releases/latest" |
        jq -r '.tag_name // empty'
}

package() {
    cd "Ore-UI-theme-pack-${pkgver}"

    _themedir="${pkgdir}/usr/share/prismlauncher/themes"
    _icondir="${pkgdir}/usr/share/prismlauncher/iconthemes"

    for d in "Ore UI - Dark Amethyst" \
             "Ore UI - Dark Diamond" \
             "Ore UI - Dark Emerald" \
             "Ore UI - Light Amethyst" \
             "Ore UI - Light Diamond" \
             "Ore UI - Light Emerald"; do
        install -d "${_themedir}/${d}"
        cp -r "${d}"/* "${_themedir}/${d}/"
    done

    install -d "${_icondir}"
    cp -r "Ore UI - Icon Pack" "${_icondir}/Ore UI"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
