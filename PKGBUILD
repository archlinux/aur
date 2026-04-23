# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=sxcs-git
_pkgname=sxcs
pkgver=1.1.0.r13.g772d2d0
pkgrel=1
pkgdesc='minimal X11 color picker and magnifier'
url='https://codeberg.org/NRK/sxcs'
arch=('i686' 'x86_64')
license=('GPL-3.0')
depends=('libx11' 'libxcursor')
makedepends=('gcc')
provides=('sxcs')
source=("$_pkgname::git+$url.git#branch=master")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git describe --long --abbrev=7 --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$_pkgname"
    export CC="${CC:-gcc}"
    ${CC} -o sxcs sxcs.c ${CFLAGS} ${LDFLAGS} -s -lX11 -lXcursor
}

package() {
    cd "$_pkgname"
    install -Dm755 sxcs "${pkgdir}/usr/bin/sxcs"
    install -Dm644 sxcs.1 "${pkgdir}/usr/share/man/man1/sxcs.1"
    command -v gzip >/dev/null 2>&1 && gzip -9 "${pkgdir}/usr/share/man/man1/sxcs.1"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

# vim: ts=4 sw=4 et:
