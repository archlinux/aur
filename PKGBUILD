# Maintainer: Ian Glen <ian@ianglen.me>

__pkgname=Mutate
_pkgname=mutate
pkgname=${_pkgname}-git
pkgver=56
pkgrel=1
pkgdesc='A simple launcher inspired by Alfred.'
arch=('i686' 'x86_64')
url="https://github.com/qdore/$__pkgname"
depends=('fcitx-qt5' 'qt5-base' 'qt5-x11extras' 'boost' 'gtk2' 'icu' 
'libxkbcommon-x11' 'libsm')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git://github.com/qdore/$__pkgname")
md5sums=('SKIP')
install=${_pkgname}.install
license=('MIT')

pkgver() {
    cd "$srcdir/$__pkgname"
    git rev-list HEAD --count
}

build() {
    cd "$srcdir/$__pkgname/src"
    qmake-qt5 PREFIX=$pkgdir/usr/bin
    make
}

package() {
    cd "$srcdir/$__pkgname/src"
    make DESTDIR="$pkgdir" install
    mkdir -p "$pkgdir/usr/share/doc/mutate/config"
    cp -R "$srcdir/$__pkgname/config" "$pkgdir/usr/share/doc/mutate/"
    chmod -R a+x "$pkgdir/usr/share/doc/mutate/config/scripts"
    chmod -R a+w "$pkgdir/usr/share/doc/mutate/config"
    mkdir -p "$pkgdir/usr/share/icons"
    cp "$srcdir/$__pkgname/info/mutate.png" "$pkgdir/usr/share/icons"
    mkdir -p "$pkgdir/usr/share/applications"
    cp "$srcdir/$__pkgname/info/Mutate.desktop" "$pkgdir/usr/share/applications"
}
