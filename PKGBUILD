# Maintainer: Phantasm <phantasm@centrum.cz>
# Contributor: Jan Neumann <neum DOT ja AT gmail DOT com>

pkgname=plasma6-themes-qogir-git
_gitname=Qogir-kde
pkgver=r131.31e7bbf
pkgrel=3
pkgdesc='Qogir-KDE is a flat design theme for KDE Plasma desktop'
arch=('any')
url='https://github.com/vinceliuice/Qogir-kde'
license=('GPL3')
optdepends=('plasma-desktop: Plasma desktop'
	    'kvantum: Kvantum application style'
	    'qogir-gtk-theme: GTK version of this theme'
	    'qogir-icon-theme: Recommended icon theme'
	    'sddm: SDDM theme')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" 'plasma5-theme-qogir-git' 'plasma5-theme-qogir')
replaces=('plasma5-theme-qogir-git' 'plasma5-theme-qogir')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
        cd ${_gitname}
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
        cd ${srcdir}/${_gitname}

        install -dm755 ${pkgdir}/usr/share/aurorae
        cp -r  aurorae/themes ${pkgdir}/usr/share/aurorae

        install -dm755 ${pkgdir}/usr/share/color-schemes
        cp -r color-schemes ${pkgdir}/usr/share

        install -dm755 ${pkgdir}/usr/share/plasma/layout-templates/
        cp -r plasma/layout-templates ${pkgdir}/usr/share/plasma

        install -dm755 ${pkgdir}/usr/share/plasma/desktoptheme/
        cp -r plasma/desktoptheme ${pkgdir}/usr/share/plasma
         
        install -dm755 ${pkgdir}/usr/share/plasma/look-and-feel/
        cp -r plasma/look-and-feel/ ${pkgdir}/usr/share/plasma

        install -dm755 ${pkgdir}/usr/share/sddm/themes/Qogir
        cp -r sddm/Qogir ${pkgdir}/usr/share/sddm/themes

        install -dm755 ${pkgdir}/usr/share/Kvantum/
        cp -r Kvantum ${pkgdir}/usr/share

        install -dm755 ${pkgdir}/usr/share/wallpapers
        rm -r wallpaper/src
        cp -r wallpaper/* ${pkgdir}/usr/share/wallpapers
}
