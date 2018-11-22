# Maintainer: Nate Simon <aurpkg (at natesimon.net)>

pkgname=xed-git
_pkgbasename=xed
pkgver=master.lmde3.r0.g7220975
pkgrel=1
pkgdesc="A small and lightweight text editor. X-Apps Project (git version)."
arch=('i686' 'x86_64' 'armv7h')
license=('GPL')
depends=('gtksourceview3' 'enchant' 'desktop-file-utils' 'libsm'
        'libpeas' 'xapps' 'gspell')
makedepends=('git' 'gnome-common' 'iso-codes' 'gobject-introspection' 'meson')
provides=($pkgname $_pkgbasename)
conflicts=(${_pkgbasename})
url='https://github.com/linuxmint/xed'

source=("${pkgname}::git+https://github.com/linuxmint/${_pkgbasename}.git")
md5sums=('SKIP')

prepare() {
    cd ${srcdir}/${pkgname}
}

pkgver() {
    cd ${srcdir}/${pkgname}
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd ${srcdir}/${pkgname}

    meson . build \
        --prefix         /usr \
        --libdir         /usr/lib \
        --libexecdir     /usr/lib \
        --bindir         /usr/bin \
        --sbindir        /usr/bin \
        --includedir     /usr/include \
        --datadir        /usr/share \
        --mandir         /usr/share/man \
        --infodir        /usr/share/info \
        --localedir      /usr/share/locale \
        --sysconfdir     /etc \
        --localstatedir  /var \
        --sharedstatedir /var/lib

    ninja -v -C build
}

package(){
    cd ${srcdir}/${pkgname}

    DESTDIR="$pkgdir/" ninja install -v -C build
}

