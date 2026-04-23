# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=selx-git
_pkgname=selx
pkgver=2.0.0.r0.gcff1781
pkgrel=1
pkgdesc='Minimal X11 selection tool'
url='https://codeberg.org/NRK/selx'
arch=('i686' 'x86_64')
license=('GPL-3.0')
depends=('libx11' 'libxext' 'libxrandr')
makedepends=('gcc')
provides=('selx')
source=("$_pkgname::git+$url.git#branch=master")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git describe --long --abbrev=7 --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$_pkgname"
    export CC="${CC:-gcc}"
    ${CC} -o selx selx.c ${CFLAGS} ${LDFLAGS} -s -lX11 -lXext -lXrandr
}

package() {
    cd "$_pkgname"
    install -Dm755 selx "${pkgdir}/usr/bin/selx"
    install -Dm644 selx.1 "${pkgdir}/usr/share/man/man1/selx.1"
    command -v gzip >/dev/null 2>&1 && gzip -9 "${pkgdir}/usr/share/man/man1/selx.1"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

# vim: ts=4 sw=4 et:
