# Maintainer: Ezra Sharp <nicekiwi@gmail.com>

pkgname=webissues-client
_pkgname=webissues
pkgver=1.1.4
pkgrel=1
pkgdesc="An open source, multi-platform system for issue tracking and team collaboration."
arch=("any")
url="http://webissues.mimec.org/"
license=("GPL3")
depends=("qt5-base>=5.6.2")
conflicts=("webissues")
provides=("webissues")
source=("http://downloads.sourceforge.net/$_pkgname/$_pkgname-$pkgver.tar.bz2" "compiler-includes.patch" "qt-5.6.patch")
md5sums=("798ec55cb123f00daa3a8ed0f9509dda" "f3f6f39b75c33c98764e45ad91eca706" "60d63e4aedc2d8b74315e2ef1bb7ab04")

build() {
    cd "$srcdir/$_pkgname-$pkgver"

    patch -Np1 -i "${srcdir}/compiler-includes.patch"
    patch -Np1 -i "${srcdir}/qt-5.6.patch"

    ./configure -prefix /usr -destdir "$pkgdir" -system-sqlite
    make
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
}

