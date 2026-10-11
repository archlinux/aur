# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=xsetwall
pkgver=1.0.3
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
)
options=(!debug)
provides=('xsetwall')
source=(
    "$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
)
sha256sums=('b366d5b9e782ceef054efe4272cccf0de040d488c4c80aa4c23ab55caf6a610f')

build() {
    cd "$pkgname"
    export CC="${CC:-gcc}"
    bash ./x build
}

package() {
    cd "$pkgname"
    install -Dm755 xsetwall "${pkgdir}/usr/bin/xsetwall"
    install -Dm644 xsetwall.1 "${pkgdir}/usr/share/man/man1/xsetwall.1"
    command -v gzip >/dev/null 2>&1 && gzip -9 "${pkgdir}/usr/share/man/man1/xsetwall.1"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 readme "${pkgdir}/usr/share/doc/${pkgname}/readme"
}

# vim: ts=4 sw=4 et:
