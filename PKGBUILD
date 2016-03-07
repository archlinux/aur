# Maintainer: Nate Simon <aurpkg (at natesimon.net)>

pkgname=xed-git
pkgver=1.0.3.r8.g057e2aa
pkgrel=1
pkgdesc="git version - gtk3 pluma fork. Maintained by Linux Mint developers."
arch=('i686' 'x86_64')
license=('GPL')
depends=('gtksourceview3' 'enchant' 'desktop-file-utils' 'libsm')
makedepends=('git' 'gnome-common' 'iso-codes')
provides=($_pkgname)
conflicts=('xed')
url='https://github.com/linuxmint/xed'
install=xed.install

source=('xed-git::git+https://github.com/linuxmint/xed.git')
md5sums=('SKIP')

pkgver() {
    cd ${srcdir}/${pkgname}
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd ${srcdir}/${pkgname}
    ./autogen.sh --with-gtk=3.0 --prefix="/usr"
    make
}

package(){
    cd ${srcdir}/${pkgname}
    make DESTDIR="$pkgdir/" install
}

