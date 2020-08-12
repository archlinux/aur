# Maintainer: Nico <desoxhd@gmail.com>
pkgname=whitesur-kde-theme-git
_themeName=WhiteSur
_gitname="$_themeName-kde"
pkgver=r22.ce5a374
pkgrel=1
pkgdesc="MacOS big sur like theme for KDE Plasma"
arch=('any')
url="https://github.com/vinceliuice/${_gitname}"
license=('GPL3')
depends=('plasma-desktop')
optdepends=('kvantum-qt5: for included kvantum theme' 'sddm: for included sddm theme' 'whitesur-icon-theme-git: matching icon theme' 'whitesur-cursor-theme-git: matching cursor theme' 'whitesur-gtk-theme-git: matching gtk theme' 'latte-dock: for included latte theme') 
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
   mkdir -p "${pkgdir}/usr/share/sddm/themes"
   mkdir -p "${pkgdir}/usr/share/wallpapers"
   
   # aurorae theme
   cp -r "${srcdir}/${_gitname}/aurorae"/* "${pkgdir}/usr/share/aurorae/themes"
   # kvantum theme
   cp -r "${srcdir}/${_gitname}/Kvantum"/* "${pkgdir}/usr/share/Kvantum"
   # color scheme
   cp -r "${srcdir}/${_gitname}/color-schemes"/* "${pkgdir}/usr/share/color-schemes"
   # desktop theme
   cp -r "${srcdir}/${_gitname}/plasma/desktoptheme"/${_themeName}* "${pkgdir}/usr/share/plasma/desktoptheme"
   cp -r "${srcdir}/${_gitname}/plasma/desktoptheme/icons" "${pkgdir}/usr/share/plasma/desktoptheme/${_themeName}"
   cp -r "${srcdir}/${_gitname}/plasma/desktoptheme/icons" "${pkgdir}/usr/share/plasma/desktoptheme/${_themeName}-alt"
   cp -r "${srcdir}/${_gitname}/plasma/desktoptheme/icons" "${pkgdir}/usr/share/plasma/desktoptheme/${_themeName}-dark"
   # look and feel
   cp -r "${srcdir}/${_gitname}/plasma/look-and-feel"/* "${pkgdir}/usr/share/plasma/look-and-feel"
   # wallpaper
   cp -r "${srcdir}/${_gitname}/wallpaper/${_themeName}" "${pkgdir}/usr/share/wallpapers"
   # sddm
   cp -r "${srcdir}/${_gitname}/sddm/${_themeName}" "${pkgdir}/usr/share/sddm/themes"
   
   # latte
   mkdir -p "$HOME/.config/latte"
   cp -r "${srcdir}/${_gitname}/latte-dock"/* "$HOME/.config/latte"
   echo "The package installed a latte-dock theme which is not deleted on removal. (Located in $HOME/.config/latte)"

} 
