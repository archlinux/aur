# Maintainer: Nate Simon <aurpkg (at natesimon.net)>

pkgname=xviewer-plugins-git
_pkgbasename=xviewer-plugins
pkgver=1.0.3.r0.g0854521
pkgrel=1
pkgdesc="Plugins for xviewer. X-Apps Project (git version)."
arch=('i686' 'x86_64')
license=('GPL')
depends=('xviewer-git' 'libpeas')
makedepends=('gnome-common')
provides=($_pkgname)
conflicts=("${_pkgbasename}")
url='https://github.com/linuxmint/xviewer-plugins'

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

