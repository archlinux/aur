# Maintainer: andrew-ld <andrew-ld@protonmail.com>

pkgname=tmulti-git
pkgver=r16.ced5984
pkgrel=1
pkgdesc="Manage multiple Telegram Desktop account"
arch=(x86_64)
url="https://github.com/andrew-ld/tmulti"
license=("GPL3")
depends=("telegram-desktop" "qt5-base")
provides=("tmulti")
makedepends=("git" "make" "gcc" "qt5-base" "imagemagick")
source=("tmulti::git+https://github.com/andrew-ld/tmulti" "tmulti.desktop")
sha1sums=("SKIP" "42425bb1b5c33d5aab7ca8236a2766aac63fa1ab")

pkgver() {
    cd "$srcdir/tmulti"
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/tmulti"
    qmake-qt5 .
    make
    convert "$srcdir/tmulti/res/icon.png" "$srcdir/tmulti.png"
}

package() {
    cd "$srcdir/tmulti"
    INSTALL_ROOT=$srcdir make install
    install -Dm755 "$srcdir/opt/tmulti/bin/tmulti" -t "$pkgdir/usr/bin/"
    install -Dm644 "$srcdir/tmulti.png" -t "$pkgdir/usr/share/pixmaps/"
    install -Dm644 "$srcdir/tmulti.desktop" -t "$pkgdir/usr/share/applications/"
}
