# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=xsetwall-git
_pkgname=xsetwall
pkgver=1.0.3.r0.g9c42ca1
pkgrel=1
pkgdesc='A minimal utility for setting wallpapers in X11 environment'
url='https://codeberg.org/0x61nas/xsetwall'
arch=(
    'x86_64'
    'aarch64'
)
license=('MIT')
depends=(
    'libx11'
)
makedepends=(
    'gcc'
    'bash'
    'git'
)
options=(!debug)
provides=('xsetwall')
source=("$_pkgname-aurora::git+$url.git#branch=aurora")
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}-aurora"
    git describe --long --abbrev=7 --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${_pkgname}-aurora"
    export CC="${CC:-gcc}"
    bash ./x build
}

package() {
    cd "${_pkgname}-aurora"
    install -Dm755 xsetwall "${pkgdir}/usr/bin/xsetwall"
    install -Dm644 xsetwall.1 "${pkgdir}/usr/share/man/man1/xsetwall.1"
    command -v gzip >/dev/null 2>&1 && gzip -9 "${pkgdir}/usr/share/man/man1/xsetwall.1"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 readme "${pkgdir}/usr/share/doc/${pkgname}/readme"
}

# vim: ts=4 sw=4 et:
