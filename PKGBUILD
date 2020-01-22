# Maintainer: FadeMind <fademind@gmail.com> 
# Contributor: Presence <hidden mail data>

pkgname=kdocker-git
_pkgname=kdocker
pkgver=5.2.r6.43379a6
pkgrel=1
pkgdesc="An application to help you dock any application into the system tray (git version)"
arch=('i686' 'x86_64')
url="https://github.com/user-none/KDocker"
license=('GPL2')
depends=('qt5-base' 'qt5-x11extras' 'libxpm' 'libxmu')
conflicts=("${_pkgname}")
replaces=("${_pkgname}")
makedepends=('git')
source=("$_pkgname::git+$url.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g;s/^v//')"
}

build() {
    cd "$srcdir/$_pkgname"
    qmake-qt5
    make
}

package() {
    cd "$srcdir/$_pkgname"
    install -Dm755 "kdocker"                             "$pkgdir/usr/bin/kdocker"
    install -Dm644 "helpers/appdata/kdocker.appdata.xml" "$pkgdir/usr/share/appdata/kdocker.appdata.xml"
    strip "$pkgdir/usr/bin/kdocker"
    install -Dm644 "resources/images/kdocker.png"        "$pkgdir/usr/share/pixmaps/kdocker.png"
    install -Dm644 "helpers/kdocker.desktop"             "$pkgdir/usr/share/applications/kdocker.desktop"
    install -Dm644 "helpers/kdocker"                     "$pkgdir/etc/bash_completion.d/kdocker"
    install -Dm644 "helpers/kdocker.1"                   "$pkgdir/usr/share/man/man1/kdocker.1"
}
