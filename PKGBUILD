# Maintainer: RinLin_NYA <aur.cxneo@slmails.com>
# Contributor: Howard Cheung <mail@h-cheung.cf>
pkgname=plasma6-themes-orchis-kde-git
_gitname=Orchis-kde
pkgver=r75.b2a9691
pkgrel=3
pkgdesc="A material Design theme for KDE Plasma desktop."
arch=('any')
url="https://github.com/vinceliuice/${_gitname}"
license=('GPL-3.0-only')
optdepends=('plasma-desktop: For included plasma theme'
            'kvantum: For included kvantum theme'
            'kvantum-qt5: For included kvantum theme on qt5'
            'sddm: For included sddm theme'
            'tela-circle-icon-theme-git: Matching icon theme'
            'orchis-theme: Matching gtk theme')
makedepends=('git')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
   cd ${_gitname}
   printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
   local _theme="Orchis"
   local _src="${srcdir}/${_gitname}"

   # Destination directories (matching install.sh global paths)
   local _aurorae="${pkgdir}/usr/share/aurorae/themes"
   local _schemes="${pkgdir}/usr/share/color-schemes"
   local _plasma="${pkgdir}/usr/share/plasma/desktoptheme"
   local _lookfeel="${pkgdir}/usr/share/plasma/look-and-feel"
   local _kvantum="${pkgdir}/usr/share/Kvantum"
   local _wallpaper="${pkgdir}/usr/share/wallpapers"
   local _sddm="${pkgdir}/usr/share/sddm/themes"

   install -d "${_aurorae}" "${_schemes}" "${_plasma}" \
              "${_lookfeel}" "${_kvantum}" "${_wallpaper}" "${_sddm}"

   # Aurorae window decoration themes
   cp -r "${_src}/aurorae"/* "${_aurorae}"

   # Color schemes
   cp -r "${_src}/color-schemes"/*.colors "${_schemes}"

   # Kvantum themes
   cp -r "${_src}/Kvantum"/* "${_kvantum}"

   # Plasma desktop themes
   cp -r "${_src}/plasma/desktoptheme/${_theme}" "${_plasma}"
   cp -r "${_src}/plasma/desktoptheme/${_theme}-dark" "${_plasma}"

   # Copy icons into each desktop theme (as install.sh does)
   cp -r "${_src}/plasma/desktoptheme/icons" "${_plasma}/${_theme}/"
   cp -r "${_src}/plasma/desktoptheme/icons" "${_plasma}/${_theme}-dark/"

   # Copy color scheme files into desktop themes (as install.sh does)
   cp -r "${_src}/color-schemes/${_theme}.colors" "${_plasma}/${_theme}/colors"
   cp -r "${_src}/color-schemes/${_theme}Dark.colors" "${_plasma}/${_theme}-dark/colors"

   # Look and feel (global themes)
   cp -r "${_src}/plasma/look-and-feel"/* "${_lookfeel}"

   # Wallpapers
   cp -r "${_src}/wallpaper"/* "${_wallpaper}"

   # SDDM theme (use 6.0 for Plasma 6)
   cp -r "${_src}/sddm/6.0"/*/ "${_sddm}"
}
