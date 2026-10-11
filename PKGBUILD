# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=drag-git
_pkgname=drag
pkgver=1.1.r0.gc952132
pkgrel=1
pkgdesc='A minimal X11 drag-and-drop utility.'
url='https://codeberg.org/ayari/drag'
arch=(
    'x86_64'
    'aarch64'
)
license=('CC0-1.0')
depends=(
    'libx11'
)
makedepends=(
    'gcc'
    'make'
    'git'
)
options=(!debug)
provides=('drag')
source=("${_pkgname}-main::git+${url}.git#branch=main")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname-main"
    git describe --tags --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${_pkgname}-main"
    export CC="${CC:-gcc}"
    make
}

package() {
    cd "${_pkgname}-main"
    install -Dm755 drag "${pkgdir}/usr/bin/drag"
    install -Dm644 drag.1 "${pkgdir}/usr/share/man/man1/drag.1"
    command -v gzip >/dev/null 2>&1 && gzip -9 "${pkgdir}/usr/share/man/man1/drag.1"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

# vim: ts=4 sw=4 et:
