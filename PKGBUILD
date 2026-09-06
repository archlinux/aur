# Maintainer: Jeremy Cantrell <jmcantrell at gmail dot com>

pkgname=diceware-eff-git
pkgver=0.2.0.r0.7a74398
pkgrel=1
pkgdesc="Generate passphrases from six-sided dice rolls"
arch=('any')
url="https://github.com/jmcantrell/${pkgname%-git}"
license=('MIT')
depends=()
makedepends=('git' 'scdoc')
checkdepends=('parallel' 'diffutils')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}" || return
    printf "%s" "$(git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

check() {
    cd "$srcdir/${pkgname%-git}" || return
    ./scripts/test
}

prepare() {
    cd "$srcdir/${pkgname%-git}" || return
    PREFIX=/usr ./scripts/prepare
}

build() {
    cd "$srcdir/${pkgname%-git}" || return
    ./scripts/build
}

package() {
    cd "$srcdir/${pkgname%-git}" || return
    DESTDIR=$pkgdir PREFIX=/usr ./scripts/install
}
