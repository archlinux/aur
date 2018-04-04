# Maintainer: Jesus Franco <jesusfranco at gmail dot com>

_pkgname="image-optimizer"
pkgname="${_pkgname}-git"
_gitname=Image-Optimizer
pkgver=c79ae12
pkgrel=1
pkgdesc="Simple losless image optimizer build for Elementary OS"
arch=('i686' 'x86_64')
url="https://github.com/gijsgoudzwaard/image-optimizer"
license=('MIT')

depends=('glib2' 'gtk3' 'hicolor-icon-theme' 'vala' 'granite' 'libpurple' 'gtksourceview3' 'libdbusmenu-gtk3' 'imagemagick')
optdepends=('elementary-icon-theme')
makedepends=('git' 'desktop-file-utils' 'hicolor-icon-theme' 'intltool' 'yelp-tools' 'gnome-common' 'gobject-introspection' 'optipng' 'jpegoptim' 'cmake' 'cmake-modules-elementary')
options=('!libtool')
conflicts=('image-optimizer' 'image-optimizer-bzr')
provides=('image-optimizer')
source=("git+https://github.com/GijsGoudzwaard/Image-Optimizer.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/Image-Optimizer"
    git describe --always | sed 's/^v//;s/-/./g;s/_/./g;'
}

build() {
    cd "${srcdir}/${_gitname}/"
    mkdir build/ && cd build
    cmake ..
    make
}

package() {
    cd "${srcdir}/${_gitname}/"
    cd build
    make DESTDIR="$pkgdir" install
}
