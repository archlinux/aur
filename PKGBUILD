# Maintainer: Gesh <gesh@gesh.uni.cx>
# Contributor: dude <brrtsm@gmail.com>

pkgname=(hledger-bin hledger-ui-bin hledger-web-bin)
pkgver=1.51.1
pkgrel=1
pkgdesc='Easy-to-use command-line/curses/web plaintext accounting tool'
arch=('x86_64')
url='http://hledger.org'
license=('GPL-3.0-or-later')
optdepends=('asciinema: hledger demo support')
_url=https://github.com/simonmichael/hledger
source=(
    hledger-${pkgver}.tar.gz::$_url/releases/download/${pkgver}/hledger-linux-x64.tar.gz
)
sha256sums=('45757fa2b8dddac386a226a396e8030b2ff5d454ced5dbb2458e30bfa29d2340')

_common_package() {
    _pkgname="$1"
    install -Dm 755 "$_pkgname" -t "$pkgdir/usr/bin/"
    install -Dm 644 hledger-completion.bash \
        "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
    install -Dm 644 "$_pkgname".1 -t "$pkgdir/usr/share/man/man1/"
    install -Dm 644 "$_pkgname".info -t "$pkgdir/usr/share/info/"
}

check() {
    ./hledger test
}

package_hledger-bin() {
    pkgdesc='Command-line interface for the hledger accounting system'
    provides=(hledger="$pkgver")
    conflicts=(hledger)
    _common_package hledger
}

package_hledger-ui-bin() {
    pkgdesc='Curses-style terminal interface for the hledger accounting system'
    provides=(hledger-ui="$pkgver")
    conflicts=(hledger-ui)
    _common_package hledger-ui
}

package_hledger-web-bin() {
    pkgdesc='Web-based user interface for the hledger accounting system'
    provides=(hledger-web="$pkgver")
    conflicts=(hledger-web)
    _common_package hledger-web
}
