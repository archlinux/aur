# Maintainer: Michael A. Sinclair <squattingmonk@gmail.com>
pkgname=nwnsc-git
pkgver=v1.1.3.r0.29fca89
pkgrel=1
pkgdesc="A command-line NWScript compiler for Neverwinter Nights"
arch=('any')
url="https://github.com/nwneetools/nwnsc"
license=('custom')
groups=()
depends=('lib32-gcc-libs')
makedepends=('git' 'cmake')
provides=("nwnsc")
conflicts=("nwnsc-bin")
source=('git+https://github.com/nwneetools/nwnsc.git')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
    cd "$srcdir/${pkgname%-git}"
    cmake .
    make
}

package() {
    cd "$srcdir/${pkgname%-git}"
    install -Dm755 nwnsc/nwnsc "$pkgdir/usr/bin/${pkgname%-git}"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"
}
