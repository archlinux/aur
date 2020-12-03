# Maintainer: Nate Simon <njsimon10@gmail.com>

pkgname=xviewer-git
_pkgbasename=xviewer
pkgver=master.lmde4.r0.gfb92517
pkgrel=1
pkgdesc="A simple and easy to use image viewer. X-Apps Project (git version)."
arch=('i686' 'x86_64' 'armv7h')
license=('GPL')
depends=('xapp' 'gtk3' 'glib2' 'cinnamon-desktop' 'libpeas' 'libexif')
makedepends=('git' 'gnome-common' 'libglade' 'gobject-introspection')
optdepends=('xviewer-plugins-git: Extra plugins')
provides=($pkgname $_pkgbasename)
conflicts=("${_pkgbasename}")
url='https://github.com/linuxmint/xviewer'

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
