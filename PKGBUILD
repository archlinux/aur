# Maintainer: Nate Simon <aurpkg (at natesimon.net)>

pkgname=xviewer-git
_pkgbasename=xviewer
pkgver=1.0.5.r0.g0e95887
pkgrel=1
pkgdesc="A simple and easy to use image viewer. X-Apps Project (git version)."
arch=('i686' 'x86_64')
license=('GPL')
depends=('gtk3' 'glib2' 'gnome-desktop' 'libpeas')
makedepends=('git' 'gnome-common' 'libglade' 'gobject-introspection')
provides=($_pkgname)
conflicts=("${_pkgbasename}")
url='https://github.com/linuxmint/xviewer'
install=xviewer.install

source=("${pkgname}::git+https://github.com/linuxmint/${_pkgbasename}.git")
md5sums=('SKIP')

pkgver() {
    cd ${srcdir}/${pkgname}
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd ${srcdir}/${pkgname}
    gnome-autogen.sh --prefix="/usr" \
        --localstatedir="/var" \
         --libexecdir="/usr/lib/${_pkgbasename}"
    make
}

package(){
    cd ${srcdir}/${pkgname}
    make DESTDIR="$pkgdir/" install
}

