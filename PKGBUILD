# Maintainer: Zoltan Guba <zoltan dot guba at gubamm dot hu>
# mksrcinfo
# updpkgsums

pkgname=find-cursor-git
_pkgname=find-cursor
pkgver=1.7
pkgrel=1
pkgdesc="Simple XLib program to highlight the cursor position."
arch=('any')
url="https://github.com/arp242/find-cursor"
license=('MIT')
groups=(system)
depends=(xorg-xrefresh libx11 xorgproto libxdamage libxrender libxext)
makedepends=('git')
provides=('find-cursor-git')
conflicts=('find-cursor')
source=("git+https://github.com/arp242/find-cursor.git")
md5sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$_pkgname"
    sed -i 's/\/local//g' Makefile
    make
    mkdir -p "$pkgdir/usr/share/man/man1"
    mkdir -p "$pkgdir/usr/share/doc/$_pkgname"
    make DESTDIR="$pkgdir" install
    cp LICENSE README.markdown "$pkgdir/usr/share/doc/$_pkgname"
}
