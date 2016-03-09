# Maintainer: Nate Simon <aurpkg (at natesimon.net)>

pkgname=xed-git
pkgver=1.0.3.r8.g057e2aa
pkgrel=1
pkgdesc="A small and lightweight text editor. X-Apps Project (git version)."
arch=('i686' 'x86_64')
license=('GPL')
depends=('gtksourceview3' 'enchant' 'desktop-file-utils' 'libsm')
makedepends=('git' 'gnome-common' 'iso-codes')
provides=($_pkgname)
conflicts=('xed' $_pkgname)
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
    ./autogen.sh --with-gtk=3.0 --prefix="/usr" \
         --localstatedir="/var" \
         --libexecdir="/usr/lib/xed"
    make
}

package(){
    cd ${srcdir}/${pkgname}
    make DESTDIR="$pkgdir/" install
}

