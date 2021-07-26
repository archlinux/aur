# Maintainer: Nicolas FORMICHELLA <stigpro@outlook.fr>

_pkgname="image-optimizer"
pkgname="${_pkgname}-git"
_gitname=Image-Optimizer
pkgver=0a9f6ee
pkgrel=1
pkgdesc="Simple losless image optimizer build for Elementary OS"
arch=('i686' 'x86_64')
url="https://github.com/gijsgoudzwaard/image-optimizer"
license=('MIT')

depends=('glib2' 'gtk3' 'hicolor-icon-theme' 'vala' 'granite' 'libpurple' 'gtksourceview3' 'libdbusmenu-gtk3' 'imagemagick' 'optipng' 'jpegoptim')
optdepends=('elementary-icon-theme')
makedepends=('git' 'desktop-file-utils' 'intltool' 'yelp-tools' 'gnome-common' 'gobject-introspection' 'cmake')
options=('!libtool')
conflicts=('image-optimizer' 'image-optimizer-bzr')
provides=('image-optimizer')
source=("git+https://github.com/GijsGoudzwaard/Image-Optimizer.git")
md5sums=('SKIP')


pkgver() {
	cd "${srcdir}/${_gitname}/"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


build() {
    cd "${srcdir}/${_gitname}/"
    meson build --prefix=${pkgdir}/usr
}

check() {
    cd "${srcdir}/${_gitname}/build"
    ninja test
}

package() {
    cd "${srcdir}/${_gitname}/build"
    ninja install
    rm "${pkgdir}/usr/share/applications/mimeinfo.cache"
    rm -f "${pkgdir}/usr/share/icons/hicolor/icon-theme.cache"
}
