# Maintainer: Nate Simon <aurpkg (at natesimon.net)>

pkgname=xed
pkgver=1.8.3
pkgrel=1
pkgdesc="A small and lightweight text editor. X-Apps Project."
arch=('i686' 'x86_64' 'armv7h')
license=('GPL')
depends=('gtksourceview3' 'enchant' 'desktop-file-utils' 'libsm'
        'libpeas' 'xapps' 'gspell')
makedepends=('gnome-common' 'iso-codes' 'gobject-introspection')
provides=($pkgname)
conflicts=('xed-git' $_pkgname)
url='https://github.com/linuxmint/xed'
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/linuxmint/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('86ef2a748c2da27810e416bcb856e309')


prepare() {
    cd ${srcdir}/${pkgname}-${pkgver}
    # https://www.archlinux.org/todo/enchant-221-rebuild/
    sed -i 's/, enchant/, enchant-2/' configure.ac
}

build() {
    cd ${srcdir}/${pkgname}-${pkgver}
    ./autogen.sh --with-gtk=3.0 --prefix="/usr" \
         --localstatedir="/var" \
         --libexecdir="/usr/lib/xed"
    make CFLAGS='-w -O2'
}

package(){
    cd ${srcdir}/${pkgname}-${pkgver}
    make DESTDIR="$pkgdir/" install
}

