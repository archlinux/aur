# Maintainer: Nico <d3sox at protonmail dot com>
pkgname=plasmasur-dark-kde-theme-git
_themeName=PlasmaSur-dark
_gitname="$_themeName-kde"
pkgver=r4.eb60128
pkgrel=1
pkgdesc="PlasmaSur-dark-kde kde is a materia Design theme for KDE Plasma desktop."
arch=('any')
url="https://github.com/yeyushengfan258/${_gitname}"
license=('GPL3')
optdepends=('plasma-desktop: for included plasma theme' 'kvantum-qt5: for included kvantum theme') 
makedepends=('git')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
   cd ${_gitname}
   printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
   # make folders
   mkdir -p "${pkgdir}/usr/share/aurorae/themes"
   mkdir -p "${pkgdir}/usr/share/color-schemes"
   mkdir -p "${pkgdir}/usr/share/plasma/desktoptheme"
   mkdir -p "${pkgdir}/usr/share/plasma/look-and-feel"
   mkdir -p "${pkgdir}/usr/share/Kvantum"
   mkdir -p "${pkgdir}/usr/share/wallpapers"
   
   # aurorae theme
   cp -r "${srcdir}/${_gitname}/aurorae"/* "${pkgdir}/usr/share/aurorae/themes"
   # kvantum theme
   cp -r "${srcdir}/${_gitname}/Kvantum"/* "${pkgdir}/usr/share/Kvantum"
   # color scheme
   cp -r "${srcdir}/${_gitname}/color-schemes"/* "${pkgdir}/usr/share/color-schemes"
   # desktop theme
   cp -r "${srcdir}/${_gitname}/plasma/desktoptheme"/${_themeName}* "${pkgdir}/usr/share/plasma/desktoptheme"
   # look and feel
   cp -r "${srcdir}/${_gitname}/plasma/look-and-feel"/* "${pkgdir}/usr/share/plasma/look-and-feel"
   # wallpaper
   cp -r "${srcdir}/${_gitname}/wallpaper/${_themeName}" "${pkgdir}/usr/share/wallpapers"
}
