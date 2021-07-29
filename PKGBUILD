# Maintainer: Sainnhe Park <sainnhe@gmail.com>
pkgbase=gruvbox-material-theme-git
_pkgbase=gruvbox-material-theme
pkgname=('gruvbox-material-gtk-theme-git'
         'gruvbox-material-icon-theme-git')
pkgver=r14.cc255d43
pkgrel=1
arch=('any')
url='https://github.com/sainnhe/gruvbox-material-gtk'
options=('!strip')
makedepends=('git')
license=('MIT')
source=("${_pkgbase}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgbase}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package_gruvbox-material-gtk-theme-git() {
    pkgdesc='Gruvbox Material theme for GTK, Gnome, Cinnamon, XFCE, Unity and Plank'
    depends=(gtk3)
    optdepends=('gtk-engine-murrine: for gtk2 theme'
                'gruvbox-material-icon-theme: gruvbox material icon theme')
    provides=(gruvbox-material-gtk-theme)
    conflicts=(gruvbox-material-gtk-theme)
    replaces=(gruvbox-material-gtk-theme)

    install -d "${pkgdir}/usr/share/themes/Gruvbox-Material-Dark"
    cd "${srcdir}/${_pkgbase}/themes/Gruvbox-Material-Dark"
    cp -r ./* "${pkgdir}/usr/share/themes/Gruvbox-Material-Dark/"

    install -d "${pkgdir}/usr/share/themes/Gruvbox-Material-Dark-HIDPI"
    cd "${srcdir}/${_pkgbase}/themes/Gruvbox-Material-Dark-HIDPI"
    cp -r ./* "${pkgdir}/usr/share/themes/Gruvbox-Material-Dark-HIDPI/"
}

package_gruvbox-material-icon-theme-git() {
    pkgdesc='Gruvbox Material icon theme'
    depends=('gtk-update-icon-cache')
    optdepends=('gruvbox-material-gtk-theme: gruvbox material gtk theme')
    provides=(gruvbox-material-icon-theme)
    conflicts=(gruvbox-material-icon-theme)
    replaces=(gruvbox-material-icon-theme)

    install -d "${pkgdir}/usr/share/icons/Gruvbox-Material-Dark"
    cd "${srcdir}/${_pkgbase}/icons/Gruvbox-Material-Dark"
    cp -r ./* "${pkgdir}/usr/share/icons/Gruvbox-Material-Dark/"
}
