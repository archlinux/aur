# Maintainer: dude <brrtsm@gmail.com>

pkgver=1.40
pkgname=(hledger-bin hledger-ui-bin hledger-web-bin)
pkgrel=2
pkgdesc="Easy-to-use command-line/curses/web plaintext accounting tool"
arch=(x86_64)
url="http://hledger.org"
license=('GPL')
depends=('gmp' 'ncurses5-compat-libs')
makedepends=('coreutils')
source=(
    hledger-${pkgver}.tar.gz::https://github.com/simonmichael/hledger/releases/download/${pkgver}/hledger-linux-x64.tar.gz
    https://raw.githubusercontent.com/simonmichael/hledger/hledger-${pkgver}/hledger/shell-completion/hledger-completion.bash
)
sha256sums=(
    8f41679941ee6e68d77b9a6f9c0d155d9e6e27265da297f92d0a5bcf5658679e
    662abb7f39b9582315a6d014012fdff56664e8cf6b2665f1d96ae3285930d4ce
)

prepare() {
    cd $srcdir
    tar -xvf ./hledger-${pkgver}.tar.gz
}

package_hledger-bin() {
    pkgdesc="Command-line interface for the hledger accounting system"
	provides=(hledger)
	conflicts=(hledger)
    depends+=(glibc)

    install -Dm 755 ./hledger "$pkgdir/usr/bin/hledger"
    install -Dm 644 hledger-completion.bash "$pkgdir/usr/share/bash-completion/completions/hledger"
}

package_hledger-ui-bin() {
    pkgdesc="Curses-style terminal interface for the hledger accounting system"
	provides=(hledger-ui)
	conflicts=(hledger-ui)
    depends+=(zlib)

    install -Dm 755 ./hledger-ui "$pkgdir/usr/bin/hledger-ui"
}

package_hledger-web-bin() {
    pkgdesc="Web-based user interface for the hledger accounting system"
	provides=(hledger-web)
	conflicts=(hledger-web)
    depends+=(zlib)

    install -Dm 755 ./hledger-web "$pkgdir/usr/bin/hledger-web"
}
