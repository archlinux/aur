# Maintainer: Florine W. Dekker
pkgname="mommy"
pkgdesc="mommy's here to support you~"
pkgver=1.2.1
pkgrel=2
url="https://github.com/FWDekker/mommy"
license=("Unlicense")
arch=("any")
depends=("sh")
checkdepends=("shellspec" "man-db")
optdepends=("man-db: for manual pages")
source=("git+https://github.com/FWDekker/mommy.git#tag=v$pkgver")
sha256sums=("SKIP")

check() {
    cd "$pkgname"
    if [ "$(pacman-conf | grep "NoExtract.*usr/share/man" | wc -l)" -gt 0 ]; then
        make -W test/man test
    else
        make test
    fi
}

package() {
    cd "$pkgname"
    make prefix="$pkgdir/usr/" install
}
