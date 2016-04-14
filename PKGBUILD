# Maintainer: Nate Simon <aurpkg (at natesimon.net)>

pkgname=xviewer-git
pkgver=1.0.1.r4.g592903c
pkgrel=1
pkgdesc="A simple and easy to use image viewer. X-Apps Project (git version)."
arch=('i686' 'x86_64')
license=('GPL')
depends=('gtk3' 'glib2' 'gnome-desktop' 'libpeas')
makedepends=('git' 'gnome-common' 'libglade' 'gobject-introspection')
provides=($_pkgname)
conflicts=('xviewer')
url='https://github.com/linuxmint/xviewer'
install=xviewer.install

source=('xviewer-git::git+https://github.com/linuxmint/xviewer.git')
md5sums=('SKIP')

pkgver() {
    cd ${srcdir}/${pkgname}
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd ${srcdir}/${pkgname}
    gnome-autogen.sh --prefix="/usr" \
        --localstatedir="/var" \
         --libexecdir="/usr/lib/xviewer"
    make
}

package(){
    cd ${srcdir}/${pkgname}
    make DESTDIR="$pkgdir/" install
}

