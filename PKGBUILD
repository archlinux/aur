# Maintainer: Nate Simon <njsimon10@gmail.com>

pkgname=xviewer-plugins-git
_pkgbasename=xviewer-plugins
pkgver=1.2.0.r0.g2fdf842
pkgrel=2
pkgdesc="Plugins for xviewer. X-Apps Project (git version)."
arch=('i686' 'x86_64' 'armv7h')
license=('GPL')
depends=('xviewer-git' 'libpeas')
makedepends=('gnome-common' 'gobject-introspection')
provides=($pkgname $_pkgbasename)
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
