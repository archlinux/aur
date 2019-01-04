# Maintainer: Laurent Treguier <laurent@treguier.org>

_oomox_ver=1.10
_oomox_theme_ver=1.10
#_materia_theme_ver=20181125
_materia_cmt=94da12f9c5dfa4e045f8f02e2c818891b13b0930
_arc_theme_cmt=88d02754d11d174a7baf3db7beb857f28dac55ee
_archdroid_icons_ver=1.0.2
_gnome_colors_icons_ver=5.5.4
_oomoxify_ver=1.1.2
_base16_cmt=2e4112fe859ed5d33f67c177f11d369d360db9ae
_numix_icons_cmt=bd40be85955dcf20b15ce03e2baf0bf3dba313cb
_numix_folders_icons_cmt=24e5f6c6603e7f798553d2f24a00de107713c333

pkgname=oomox
pkgver=${_oomox_ver}
pkgrel=2
pkgdesc='Graphical application for generating different color variations of Numix/Materia/Arc theme (GTK2, GTK3), gnome-colors and ArchDroid icon themes. Have a hack for HiDPI in gtk2.'
arch=('i686' 'x86_64')
url='https://github.com/themix-project/oomox'
license=('GPL3')
depends=(
	'gtk3'
	'python-gobject'
	'glib2'  # oomox, materia, arc
	'gdk-pixbuf2'  # oomox, materia, arc
	'gtk-engine-murrine'  # oomox, materia, arc
	'gtk-engines'  # oomox, materia, arc
	'gnome-themes-extra'  # materia
	'sassc'  # oomox, materia, arc
	'librsvg'  # oomox, gnome-colors
	'sed'  # oomox, materia, arc, gnome-colors, archdroid
	'findutils'  # oomox, materia, arc, gnome-colors, arch-droid
	'grep'  # oomoxify, oomox, materia, arc, gnome-colors
	'bc'  # oomoxify, oomox, materia, arc, gnome-colors
	'zip'  # oomoxify
	'polkit'  # oomoxify
	'imagemagick'  # gnome-colors
	'parallel'  # materia, arc
	'optipng'  # materia, arc
	'python-pillow'  # import_pil
	'python-pystache'  #  base16_format
	'python-yaml'  #  base16_format

	#'resvg'  # materia, arc
	##or
	'inkscape'  # materia, arc
)
optdepends=(
	'xorg-xrdb: for the `xresources` theme'
	'breeze-icons: more fallback icons'
	'gksu: for applying Spotify theme from GUI without polkit'
	'colorz: additional image analyzer for "Import colors from image" plugin'
	'python-colorthief: additional image analyzer for "Import colors from image" plugin'
	'python-haishoku: additional image analyzer for "Import colors from image" plugin'
)
options=(
    '!strip'
)
provides=('oomox')
conflicts=('oomox-git')
    # "materia-theme-v${_materia_theme_ver}.tar.gz::https://github.com/nana-4/materia-theme/archive/v${_materia_theme_ver}.tar.gz"
source=(
    "oomox-${_oomox_ver}.tar.gz::https://github.com/themix-project/oomox/archive/${_oomox_ver}.tar.gz"
    "oomox-gtk-theme-${_oomox_theme_ver}.tar.gz::https://github.com/themix-project/oomox-gtk-theme/archive/${_oomox_theme_ver}.tar.gz"
    "materia-theme-${_materia_cmt}.tar.gz::https://github.com/nana-4/materia-theme/archive/${_materia_cmt}.tar.gz"
    "arc-theme-${_arc_theme_cmt}.tar.gz::https://github.com/NicoHood/arc-theme/archive/${_arc_theme_cmt}.tar.gz"
    "archdroid-icon-theme-${_archdroid_icons_ver}.tar.gz::https://github.com/themix-project/oomox-archdroid-icon-theme/archive/${_archdroid_icons_ver}.tar.gz"
    "gnome-colors-icon-theme-${_gnome_colors_icons_ver}.tar.gz::https://github.com/themix-project/oomox-gnome-colors-icon-theme/archive/${_gnome_colors_icons_ver}.tar.gz"
    "oomoxify-${_oomoxify_ver}.tar.gz::https://github.com/themix-project/oomoxify/archive/${_oomoxify_ver}.tar.gz"
    "base16_mirror-${_base16_cmt}.tar.gz::https://github.com/themix-project/base16_mirror/archive/${_base16_cmt}.tar.gz"
    "numix-icon-theme-${_numix_icons_cmt}.tar.gz::https://github.com/numixproject/numix-icon-theme/archive/${_numix_icons_cmt}.tar.gz"
    "numix-folders-${_numix_folders_icons_cmt}.tar.gz::https://github.com/numixproject/numix-folders/archive/${_numix_folders_icons_cmt}.tar.gz"
)
md5sums=('4012421ef63e3b8aa5e165999f739011'
         '13945f05eba3b85e6d63fec1ff60380a'
         'b1dccfa1a77c3b051762a2583a6c070f'
         '031f263be091e16de8932bfc4b7cfe82'
         'cb669130685dcbf03a8f7f5738c71dc6'
         'b5bc6ce914908c1e8f88180889b427e3'
         '743395f8490fe7d2ec1525930f019d97'
         '8f7506b74131bfce78685aade0e275eb'
         'a291f15685641f5be20493e6775d54c5'
         '3fcb07cefe43a6a2fe4d977f124624ec')

prepare() {
    cd ${srcdir}
    cp -pr "${pkgname}-gtk-theme-${_oomox_theme_ver}"/* "${pkgname}-${_oomox_ver}/plugins/theme_oomox/gtk-theme"
    #cp -pr "materia-theme-${_materia_theme_ver}"/* "${pkgname}-${_oomox_ver}/plugins/theme_materia/materia-theme"
    cp -pr "materia-theme-${_materia_cmt}"/* "${pkgname}-${_oomox_ver}/plugins/theme_materia/materia-theme"
    cp -pr "arc-theme-${_arc_theme_cmt}"/* "${pkgname}-${_oomox_ver}/plugins/theme_arc/arc-theme"
    cp -pr "archdroid-icon-theme-${_archdroid_icons_ver}"/* "${pkgname}-${_oomox_ver}/plugins/icons_archdroid/archdroid-icon-theme"
    cp -pr "gnome-colors-icon-theme-${_gnome_colors_icons_ver}"/* "${pkgname}-${_oomox_ver}/plugins/icons_gnomecolors/gnome-colors-icon-theme"
    cp -pr "oomoxify-${_oomoxify_ver}"/* "${pkgname}-${_oomox_ver}/plugins/oomoxify"
    cp -pr "base16_mirror-${_base16_cmt}"/* "${pkgname}-${_oomox_ver}/plugins/base16/base16_mirror"
    cp -pr "numix-icon-theme-${_numix_icons_cmt}"/* "${pkgname}-${_oomox_ver}/plugins/icons_numix/numix-icon-theme"
    cp -pr "numix-folders-${_numix_folders_icons_cmt}"/* "${pkgname}-${_oomox_ver}/plugins/icons_numix/numix-folders"
}

package() {
    _oomox_dir="/opt/${pkgname}"
    _oomox_gui_dir="${_oomox_dir}/oomox_gui"

    cd "${srcdir}/${pkgname}-${_oomox_ver}"
    make DESTDIR="${pkgdir}" APPDIR="${_oomox_dir}" PREFIX="/usr" install
    python -O -m compileall "${pkgdir}/${_oomox_gui_dir}" -d "${_oomox_gui_dir}"
}
