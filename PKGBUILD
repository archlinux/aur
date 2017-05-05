# Maintainer: Nate Simon <aurpkg (at natesimon.net)>

pkgname=xed-git
_pkgbasename=xed
pkgver=1.4.0.r3.gcca4b0b
pkgrel=1
pkgdesc="A small and lightweight text editor. X-Apps Project (git version)."
arch=('i686' 'x86_64')
license=('GPL')
depends=('gtksourceview3' 'enchant' 'desktop-file-utils' 'libsm'
        'libpeas')
makedepends=('git' 'gnome-common' 'iso-codes' 'gobject-introspection')
provides=($_pkgname)
conflicts=(${_pkgbasename})
url='https://github.com/linuxmint/xed'
install=xed.install

source=("${pkgname}::git+https://github.com/linuxmint/${_pkgbasename}.git")
md5sums=('SKIP')

pkgver() {
    cd ${srcdir}/${pkgname}
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd ${srcdir}/${pkgname}
    ./autogen.sh --with-gtk=3.0 --prefix="/usr" \
         --localstatedir="/var" \
         --libexecdir="/usr/lib/xed"
    make CFLAGS='-w -O2'
}

package(){
    cd ${srcdir}/${pkgname}
    make DESTDIR="$pkgdir/" install
}

