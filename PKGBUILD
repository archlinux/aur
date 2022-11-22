# Maintainer: Xinc

pkgname=libunity-misc
_actual_ver=4.0.5
_extra_ver=+14.04.20140115
pkgver=${_actual_ver}${_extra_ver/\+/.}
pkgrel=1
pkgdesc="Miscellaneous modules for the Unity7 user interface"
arch=(x86_64)
url="https://launchpad.net/libunity-misc"
license=(GPL)
depends=(cairo glibc gtk3 glib2)
makedepends=(gnome-common make gtk-doc patch)
source=("https://launchpad.net/ubuntu/+archive/primary/+files/libunity-misc_${_actual_ver}${_extra_ver}.orig.tar.gz")
sha512sums=('SKIP')

prepare() {
    cd "${pkgname}-${_actual_ver}${_extra_ver}"

    patch -p1 -i ../../0001_autotools.patch
}

build() {
    cd "${pkgname}-${_actual_ver}${_extra_ver}"

    gtkdocize
    autoreconf -vfi
    ./configure --prefix=/usr --disable-static
    make CFLAGS="-Wno-error"
}

package() {
    cd "${pkgname}-${_actual_ver}${_extra_ver}"

    make DESTDIR="${pkgdir}/" install
}
