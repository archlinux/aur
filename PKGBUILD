# Maintainer: Jeremy Cantrell <jmcantrell at gmail dot com>

pkgname=btrfs-snapshots
pkgver=0.2.2
pkgrel=1
pkgdesc="Manage collections of btrfs snapshots"
arch=('any')
url="https://gitlab.com/jmcantrell/$pkgname"
license=('GPL3')
depends=('btrfs-progs')
source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('6734d8732d82a03fc4478d26fcbd399634a0ddbf37bedf685a789122e6fc10c6')

check() {
    cd "$srcdir/$pkgname-v$pkgver"
    ./test.sh
}

prepare() {
    local file
    while read -r file; do
        sed -i "\:/usr/local/etc:s:/usr/local::g" "$file"
        sed -i "\:/usr/local:s:/usr/local:/usr:g" "$file"
    done < <(find "$srcdir/$pkgname-v$pkgver" -type f)
}

package() {
    cd "$srcdir/$pkgname-v$pkgver"
    INSTALL_ROOT=$pkgdir/usr ./install.sh
}
