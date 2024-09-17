# Maintainer: dude <brrtsm@gmail.com>

pkgver=1.40
pkgname=(hledger-bin hledger-ui-bin hledger-web-bin)
pkgrel=5
pkgdesc="Easy-to-use command-line/curses/web plaintext accounting tool"
arch=(x86_64)
url="http://hledger.org"
license=('GPL')
depends=('gmp' 'ncurses5-compat-libs')
makedepends=('coreutils')
optdepends=('asciinema: hledger demo support')
source=(
    hledger-${pkgver}.tar.gz::https://github.com/simonmichael/hledger/releases/download/${pkgver}/hledger-linux-x64.tar.gz
    https://raw.githubusercontent.com/simonmichael/hledger/hledger-${pkgver}/hledger/shell-completion/hledger-completion.bash
    https://raw.githubusercontent.com/simonmichael/hledger/hledger-${pkgver}/hledger/hledger.1
    https://raw.githubusercontent.com/simonmichael/hledger/hledger-${pkgver}/hledger-ui/hledger-ui.1
    https://raw.githubusercontent.com/simonmichael/hledger/hledger-${pkgver}/hledger-web/hledger-web.1
)
sha256sums=(
    8f41679941ee6e68d77b9a6f9c0d155d9e6e27265da297f92d0a5bcf5658679e
    662abb7f39b9582315a6d014012fdff56664e8cf6b2665f1d96ae3285930d4ce
    cb37c183da683bd6031c881272998f994a60ead08b25e61c4698d6cbc3269968
    7a789e1a2b82f0e250efb5ec0d1b630a6053cabb2912bccddee7f65fc08fe992
    cfd949b03ce0a0ce20d7ab1e99173456465d02716cc3ad472a4be7bc2e31d325
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
    install -Dm 644 hledger.1 -t "$pkgdir/usr/share/man/man1/"
}

package_hledger-ui-bin() {
    pkgdesc="Curses-style terminal interface for the hledger accounting system"
	provides=(hledger-ui)
	conflicts=(hledger-ui)
    depends+=(zlib)

    install -Dm 755 ./hledger-ui "$pkgdir/usr/bin/hledger-ui"
    mkdir -p "$pkgdir/usr/share/bash-completion/completions/"
    ln -sr "$pkgdir/usr/share/bash-completion/completions/hledger"{,-ui}
    install -Dm 644 hledger-ui.1 -t "$pkgdir/usr/share/man/man1/"
}

package_hledger-web-bin() {
    pkgdesc="Web-based user interface for the hledger accounting system"
	provides=(hledger-web)
	conflicts=(hledger-web)
    depends+=(zlib)

    install -Dm 755 ./hledger-web "$pkgdir/usr/bin/hledger-web"
    mkdir -p "$pkgdir/usr/share/bash-completion/completions/"
    ln -sr "$pkgdir/usr/share/bash-completion/completions/hledger"{,-web}
    install -Dm 644 hledger-web.1 -t "$pkgdir/usr/share/man/man1/"
}
