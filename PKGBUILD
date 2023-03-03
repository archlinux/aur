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
    [ "$(pacman-conf | grep "NoExtract.*usr/share/man" | wc -l)" -gt 0 ] && MOMMY_TEST_MAN="0"

    MOMMY_TEST_MAN=MOMMY_TEST_MAN ./$pkgname/test.sh
}

package() {
    PREFIX="$pkgdir/usr/" "./$pkgname/build.sh" install
}
