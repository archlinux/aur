# Maintainer: Zoltan Guba <zoltan dot guba at gubamm dot hu>
# makepkg --printsrcinfo > .SRCINFO
# makepkg -g >>PKGBUILD

pkgname=find-cursor
pkgver=1.6
pkgrel=8
pkgdesc="Simple XLib program to highlight the cursor position."
arch=('any')
url="https://github.com/arp242/find-cursor"
license=('MIT')
groups=(system)
depends=(xorg-xrefresh)
makedepends=(xz pacman-contrib)
provides=('find-cursor')
conflicts=('find-cursor')
source=("git+https://github.com/arp242/find-cursor.git")
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git tag | tail -1 | tr -d v
}

package() {
    cd "$pkgname"
    sed -i 's/\/local//g' Makefile
    make
    mkdir -p "$pkgdir/usr/share/man/man1"
    mkdir -p "$pkgdir/usr/share/doc/$pkgname"
    make DESTDIR="$pkgdir" install
    cp LICENSE README.markdown "$pkgdir/usr/share/doc/$pkgname"
}
