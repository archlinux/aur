# Maintainer: water_lift <0xWATERx0@gmail.com>
# Maintainer: Dust1404 <unknown>
pkgname=lemonplus-git
pkgver=20191121
pkgrel=2
epoch=
pkgdesc="A tiny judging environment for OI contest based on Project_Lemon"
arch=(x86_64)
url="https://github.com/Dust1404/Project_LemonPlus"
license=('GPL3')
groups=()
depends=('qt5-base')
makedepends=('git' 'qt5-base')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=('git+https://github.com/Dust1404/Project_LemonPlus' 'LemonPlus.desktop')
noextract=()
md5sums=('SKIP' '321fca1aae094e762cd46bbf9eea83ef')

pkgver() {
    cd "$srcdir/Project_LemonPlus"
    git log -1 --format="%cd" --date=short | sed 's|-||g'
}

build() {
    cd "$srcdir/Project_LemonPlus"
    gcc watcher_unix.c -o watcher_unix -O2
    gcc realjudge.c -o realjudge_linux -O2
    qmake lemon.pro
    make
}

package() {
    cd "$pkgdir"

    install -Dm644 "$srcdir/Project_LemonPlus/icon.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/lemon.png"
    install -Dm644 "$srcdir/LemonPlus.desktop" "$pkgdir/usr/share/applications/LemonPlus.desktop"
    cp -Rv "$srcdir/Project_LemonPlus/lemon" "$pkgdir/usr/bin/lemon"
}
