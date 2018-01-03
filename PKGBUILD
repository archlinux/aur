# Maintainer: Laurent Treguier <laurent@treguier.org>

_oomox_ver=1.4.5.2
_numix_ver=1.4.0.1
_materia_ver=20171213
_archdroid_ver=1bf91f49f76112d48415bfa997aabc2cea84f01d
_gnome_colors_ver=3c8596ea630b8255b9cf5d5bf90a69658dd32b79
_oomoxify_ver=5640e1c2323a319ede50b24b2d2f45b49e76e112

pkgname=oomox
pkgver=${_oomox_ver}_${_numix_ver}_${_materia_ver}
pkgrel=2
pkgdesc='Graphical application for generating different color variations of Numix/Materia theme (GTK2, GTK3), gnome-colors and ArchDroid icon themes.
Have a hack for HiDPI in gtk2.'
arch=('i686' 'x86_64')
url='https://github.com/actionless/oomox'
license=('GPL3')
depends=(
    'coreutils'
    'bash'
    'bc'
    'gdk-pixbuf2'
    'glib2'
    'gtk-engine-murrine'
    'gtk-engines'
    'imagemagick'
    'inkscape'
    'optipng'
    'parallel'
    'polkit'
    'python-gobject'
    'sassc'
    'zip'
)
optdepends=(
    'xorg-xrdb: for the `xresources` theme'
    'gnome-colors-common-icon-theme: for using the generated icon theme'
    'breeze-icons: more fallback icons'
    'gksu: for applying Spotify theme from GUI without polkit'
)
options=(
    '!strip'
)
provides=('oomox')
conflicts=('oomox-git')
source=(
    "oomox-${_oomox_ver}.tar.gz::https://github.com/actionless/oomox/archive/${_oomox_ver}.tar.gz"
    "oomox-gtk-theme-${_numix_ver}.tar.gz::https://github.com/actionless/oomox-gtk-theme/archive/${_numix_ver}.tar.gz"
    "materia-theme-${_materia_ver}.tar.gz::https://github.com/nana-4/materia-theme/archive/v${_materia_ver}.tar.gz"
    "oomox-archdroid-icon-theme-${_archdroid_ver}.zip::https://github.com/actionless/oomox-archdroid-icon-theme/archive/${_archdroid_ver}.zip"
    "oomox-gnome-colors-icon-theme-${_gnome_colors_ver}.zip::https://github.com/actionless/oomox-gnome-colors-icon-theme/archive/${_gnome_colors_ver}.zip"
    "oomoxify-${_oomoxify_ver}.zip::https://github.com/actionless/oomoxify/archive/${_oomoxify_ver}.zip"
)
md5sums=('e5b3929e1aefb9a872a809a42e9b9bc3'
         '464f7896aabe2b813bf55dab6f61f364'
         'c12b3b8813f1fe5a92525e55d68afa9e'
         'b02338c77e033933c28b8e95d8c74b71'
         '1494fc4bf2d4b17966cf81cfc39212f6'
         '41d604da88231b844402673b454300ea')

prepare() {
    cp -pr "${srcdir}/${pkgname}-gtk-theme-${_numix_ver}"/* "${srcdir}/${pkgname}-${_oomox_ver}/gtk-theme"
    cp -pr "${srcdir}/materia-theme-${_materia_ver}"/* "${srcdir}/${pkgname}-${_oomox_ver}/materia-theme"
    cp -pr "${srcdir}/${pkgname}-archdroid-icon-theme-${_archdroid_ver}"/* "${srcdir}/${pkgname}-${_oomox_ver}/archdroid-icon-theme"
    cp -pr "${srcdir}/${pkgname}-gnome-colors-icon-theme-${_gnome_colors_ver}"/* "${srcdir}/${pkgname}-${_oomox_ver}/gnome-colors-icon-theme"
    cp -pr "${srcdir}/oomoxify-${_oomoxify_ver}"/* "${srcdir}/${pkgname}-${_oomox_ver}/oomoxify"
}

package() {
    install -d "${pkgdir}/opt/${pkgname}"
    cd "${srcdir}/oomox-${_oomox_ver}"
    ./packaging/install.sh . "${pkgdir}"
    python -O -m compileall "${pkgdir}/opt/${pkgname}/oomox_gui"
}
