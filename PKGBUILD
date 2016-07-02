# Maintainer: Nate Simon <aurpkg (at natesimon.net)>

pkgname=xplayer-plparser-git
_pkgbasename=xplayer-plparser
pkgver=1.0.2.r0.gf39fa8e
pkgrel=1
pkgdesc="Playlist parser for xplayer. X-Apps Project (git version)."
arch=('i686' 'x86_64')
license=('GPL')
depends=('gmime' 'libsoup' 'libarchive' 'libquvi')
makedepends=('git' 'gnome-common' 'gtk-doc' 'gobject-introspection')
provides=($_pkgname)
conflicts=("${_pkgbasename}")
url='https://github.com/linuxmint/xplayer-plparser'

source=("${pkgname}::git+https://github.com/linuxmint/${_pkgbasename}.git")
md5sums=('SKIP')

pkgver() {
    cd ${srcdir}/${pkgname}
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd ${srcdir}/${pkgname}
    ./autogen.sh --prefix="/usr" \
         --localstatedir="/var" \
         --libexecdir="/usr/lib/${_pkgbasename}"
    make
}

package(){
    cd ${srcdir}/${pkgname}
    make DESTDIR="$pkgdir/" install
}

