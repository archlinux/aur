# Maintainer: Can Celasun <can [at] dcc [dot] im>

pkgbase=canta-theme-git
_pkgname=canta-theme
pkgname=('canta-gtk-theme-git' 'canta-icon-theme-git')
pkgdesc="Flat Material Design theme for GTK 3, GTK 2 and Gnome-Shell"
pkgver=Canta.theme_2018_03_28.r0.223123c
pkgrel=1
arch=('any')
url="https://github.com/vinceliuice/Canta-theme"
license=('GPL2')
optdepends=('numix-circle-icon-theme-git: recommended base icon theme'
            'gtk-engine-murrine: needed for gtk2 theme'
            'gnome-themes-standard: needed for gtk2 theme')
makedepends=('gtk3' 'git')

source=("${_pkgname}::git+https://github.com/vinceliuice/Canta-theme.git"
        "installer.patch")
md5sums=('SKIP'
         '6e71e7637aaf124e4271366e15b596ec')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${_pkgname}"
    
    # Build GTK theme
    patch -Np1 < "${srcdir}"/installer.patch
    rm -rf build
    mkdir build
    DEST_DIR=build ./install.sh
}

package_canta-gtk-theme-git() {
    mkdir -p "${pkgdir}"/usr/share/themes/
    cp "${srcdir}"/${_pkgname}/build/* "${pkgdir}"/usr/share/themes/ -R
}

package_canta-icon-theme-git() {
    pkgdesc="Flat icons for Canta GTK theme"
    
    mkdir -p "${pkgdir}"/usr/share/icons/Canta
    cp "${srcdir}"/${_pkgname}/src/icons/Canta/* "${pkgdir}"/usr/share/icons/Canta -R
}

