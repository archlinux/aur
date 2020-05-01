# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: desbma
pkgname=bat-extras-git
pkgver=20200408.r34.gd5fa651
pkgrel=1
pkgdesc="Bash scripts that integrate bat with various command line tools."
arch=('any')
url="https://github.com/eth-p/bat-extras"
license=('MIT')
depends=('bat')
makedepends=('git')
optdepends=('ripgrep: required for batgrep script'
            'entr: optional for batwatch script'
            'ncurses: optional for batdiff script'
            'prettier: various formatting for prettybat'
            'shfmt: bash formatting for prettybat')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/eth-p/bat-extras.git')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/${pkgname%-git}"
    ./build.sh --minify=none --no-verify
}

package() {
    cd "$srcdir/${pkgname%-git}"
    install -Dm755 bin/* -t "$pkgdir/usr/bin"
    install -Dm644 doc/* -t "$pkgdir/usr/share/doc/${pkgname%-git}"
    install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/${pkgname%-git}"
}
