# Maintainer: Rafael Silva <silvagracarafael@gmail.com>

_pkgbase=moe-theme
pkgbase="${_pkgbase}-git"
pkgname=(plasma-theme-moe-git kvantum-theme-moe-git)
pkgver=r20.4c1f4df
pkgrel=3
pkgdesc="Moe is a light theme, with blur transparencies and red tones with gradients."
arch=(any)
url="https://gitlab.com/jomada/${_pkgbase}"
license=(GPL3)
makedepends=(git)
options=(!strip)
source=("${_pkgbase}::git+https://gitlab.com/jomada/${_pkgbase}")
sha256sums=('SKIP')

pkgver() {
	cd "${_pkgbase}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package_plasma-theme-moe-git() {
    optdepends=('kvantum-theme-moe-git: Moe theme for Kvantum (recommended)')

    cd "${srcdir}/${_pkgbase}"

	install -d "${pkgdir}"/usr/share/plasma/desktoptheme "${pkgdir}"/usr/share/plasma/look-and-feel "${pkgdir}"/usr/share/aurorae/themes "${pkgdir}"/usr/share/color-schemes "${pkgdir}"/usr/share/konsole

    cp -dr --no-preserve=ownership Moe{,Dark} "${pkgdir}"/usr/share/plasma/desktoptheme/
    cp -dr --no-preserve=ownership look-and-feel/Moe "${pkgdir}"/usr/share/plasma/look-and-feel/
    cp -dr --no-preserve=ownership {,MoeDark-}aurorae/* "${pkgdir}"/usr/share/aurorae/themes
    cp -dr --no-preserve=ownership {,Moe-Dark-}color-schemes/* "${pkgdir}"/usr/share/color-schemes
    cp -dr --no-preserve=ownership {,Moe-Dark-}konsole/* "${pkgdir}"/usr/share/konsole
}

package_kvantum-theme-moe-git() {
    depends=(kvantum-qt5)

    cd "${srcdir}/${_pkgbase}"

	install -d "${pkgdir}"/usr/share/Kvantum

    cp -dr --no-preserve=ownership {,Moe-Dark-}kvantum/* "${pkgdir}"/usr/share/Kvantum
}
