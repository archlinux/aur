# Maintainer: Antonio Cardace <antonio@cardace.com>
pkgname=kmailapplet-git
pkgver=r24.fa4d4e5
pkgrel=1
pkgdesc="A Mail Applet for the system tray to watch your Maildir box and get notifications whenever there's a new mail."
arch=('any')
url="https://github.com/ichigo663/KMailApplet"
license=('GPL3')
depends=('glibc' 'gcc-libs' 'boost-libs' 'qt5-base')
makedepends=('git' 'gcc' 'make' 'qt5-base' 'boost')
provides=("$pkgname")
conflicts=("$pkgname")
source=("$pkgname::git+https://github.com/ichigo663/KMailApplet.git")
md5sums=("SKIP")

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$pkgname"
    qmake -o Makefile build.pro
    make
}

package() {
    cd "$srcdir/$pkgname"
    cp -r usr etc $pkgdir
    chmod -R 755 "$pkgdir/usr" "$pkgdir/etc"
    mkdir -p "$pkgdir/usr/bin/"
    cp KMailApplet "$pkgdir/usr/bin/"
}
