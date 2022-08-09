# Maintainer: Jeremy Cantrell <jmcantrell at gmail dot com>

pkgname=btrfs-snapshots
pkgver=0.6.1
pkgrel=2
pkgdesc="Manage timestamped collections of btrfs snapshots"
arch=('any')
url="https://github.com/jmcantrell/$pkgname"
license=('GPL3')
depends=('btrfs-progs')
checkdepends=('parallel' 'diffutils')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4a730f6da32408f1ab5fc519515f07bf58f8dd39c2f9bd554189c8f4bebca698')

check() {
    cd "$srcdir/$pkgname-$pkgver"
    ./scripts/test
}

prepare() {
    local file
    while read -r file; do
        sed -i "\:/usr/local/etc:s:/usr/local::g" "$file"
        sed -i "\:/usr/local:s:/usr/local:/usr:g" "$file"
    done < <(find "$srcdir/$pkgname-$pkgver" -type f)
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    INSTALL_ROOT=$pkgdir/usr ./scripts/install
}
