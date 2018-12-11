# Maintainer: Nate Simon <aurpkg (at natesimon.net)>

pkgname=xed
pkgver=2.0.2
pkgrel=1
pkgdesc="A small and lightweight text editor. X-Apps Project."
arch=('i686' 'x86_64' 'armv7h')
license=('GPL')
depends=('gtksourceview3' 'enchant' 'desktop-file-utils' 'libsm'
        'libpeas' 'xapps' 'gspell')
makedepends=('gnome-common' 'iso-codes' 'gobject-introspection' 'meson')
provides=($pkgname)
conflicts=('xed-git' $_pkgname)
url='https://github.com/linuxmint/xed'
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/linuxmint/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('209c38ed4001774ee085387aa7e72292')


prepare() {
    cd ${srcdir}/${pkgname}-${pkgver}
}

build() {
    cd ${srcdir}/${pkgname}-${pkgver}

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
    cd ${srcdir}/${pkgname}-${pkgver}

    DESTDIR="$pkgdir/" ninja install -v -C build
}

