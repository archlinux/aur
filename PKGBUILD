# Maintainer: ccat3z <c0ldcat3z@gmail.com>

pkgver=1.21
pkgname=(hledger-bin hledger-ui-bin hledger-web-bin)
pkgrel=4
pkgdesc="Easy-to-use command-line/curses/web plaintext accounting tool"
arch=(x86_64)
url="http://hledger.org"
license=('GPL')
depends=('gmp' 'ncurses5-compat-libs')
makedepends=('coreutils')
source=(
    hledger-${pkgver}.zip::https://github.com/simonmichael/hledger/releases/download/${pkgver}/hledger-ubuntu.zip
    patch-ncurses5.sh
)
sha256sums=(
    259affe4245789f754b82ecce5a72c0908fcdb655fb42f5a6496d6967993d992
    7ab08be2e715f6b647ce3b6cfdac1b6c2e3e1e35b6409439f6c02ad04ed9789f
)

prepare() {
    cd $srcdir
    for elf in hledger hledger-ui hledger-web; do
        ./patch-ncurses5.sh $elf
    done
}

package_hledger-bin() {
    pkgdesc="Command-line interface for the hledger accounting system"
	provides=(hledger)
	conflicts=(hledger)
    depends+=(glibc)

    install -Dm 755 ./hledger "$pkgdir/usr/bin/hledger"
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
