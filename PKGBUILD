# Maintainer: Gesh <gesh@gesh.uni.cx>
# Contributor: dude <brrtsm@gmail.com>

pkgname=(hledger-bin hledger-ui-bin hledger-web-bin)
pkgver=1.41
pkgrel=1
pkgdesc='Easy-to-use command-line/curses/web plaintext accounting tool'
arch=('x86_64')
url='http://hledger.org'
license=('GPL-3.0-or-later')
optdepends=('asciinema: hledger demo support')
_url=https://github.com/simonmichael/hledger
source=(
    hledger-${pkgver}.tar.zip::$_url/releases/download/${pkgver}/hledger-linux-x64.zip
)
for i in hledger hledger-ui hledger-web; do
source+=($i-${pkgver}.1::${_url/github/raw.githubusercontent}/hledger-${pkgver}/$i/$i.1)
done
sha256sums=('97b28749dbd673f093f0f0784b0cd938f41f0729bb4a73daf3aa56d7994c3353'
            'd8608500460bddd820429a1b6a46e1a6f4f2955666c0ddf33969f2eb2d6886cc'
            '8f4aa0bc4b0474596a06b48e9227fa6c18ecb58b123c078f81776ef4d2eb85ee'
            'b49e60026438567f9ed98c80930ac9c2d60e637e2518a2ae4eaed606f16c46cb')

prepare() {
    cd "$srcdir"
    tar -xvf ./hledger-linux-x64.tar
}

_common_package() {
    _pkgname="$1"
    install -Dm 755 "$_pkgname" -t "$pkgdir/usr/bin/"
    install -Dm 644 hledger-completion.bash \
        "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
    install -Dm 644 "$_pkgname-$pkgver".1 \
        "$pkgdir/usr/share/man/man1/$_pkgname.1"
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
