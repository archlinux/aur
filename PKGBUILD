# Maintainer: neodarz <neodarz@neodarz.net>

pkgbase=terminalimageviewer
pkgname=terminalimageviewer-git
_pkgname=TerminalImageViewer
pkgver=r46.65ebc0a
pkgrel=2
pkgdesc="Small C++ program to display images in a (modern) terminal using RGB ANSI codes and unicode block graphics characters"
arch=('i686' 'x86_64')
url="https://github.com/stefanhaustein/$_pkgname"
license=('Apache')
makedepends=(git make gcc imagemagick)
provides=("$_pkgname" "tiv")
conflicts=("$_pkgname" "tiv")
source=("$pkgname"::"git+https://github.com/stefanhaustein/$_pkgname.git")
noextract=()
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    cd $srcdir/$pkgname/src/main/cpp
    make
}


package() {
    cd $srcdir/$pkgname
    install -Dm755 src/main/cpp/tiv $pkgdir/usr/bin/tiv
}
                                        
