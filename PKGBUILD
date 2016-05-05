# Maintainer: Nate Simon <aurpkg (at natesimon.net)>

pkgname=xviewer-plugins-git
pkgver=1.0.2.r2.g546f53e
pkgrel=1
pkgdesc="Plugins for xviewer. X-Apps Project (git version)."
arch=('i686' 'x86_64')
license=('GPL')
depends=('xviewer-git' 'libpeas')
makedepends=('gnome-common')
provides=($_pkgname)
conflicts=('xviewer-plugins-git')
url='https://github.com/linuxmint/xviewer-plugins'

source=('xviewer-plugins-git::git+https://github.com/linuxmint/xviewer-plugins.git')
md5sums=('SKIP')

pkgver() {
    cd ${srcdir}/${pkgname}
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd ${srcdir}/${pkgname}
    ./autogen.sh --prefix="/usr" \
        --localstatedir="/var" \
        --libexecdir="/usr/lib/xviewer-plugins"
    make
}

package(){
    cd ${srcdir}/${pkgname}
    make DESTDIR="$pkgdir/" install
}

