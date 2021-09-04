# Maintainer: Jeremy Cantrell <jmcantrell at gmail dot com>

pkgname=btrfs-snapshots
pkgver=0.6.1
pkgrel=1
pkgdesc="Manage timestamped collections of btrfs snapshots"
arch=('any')
url="https://gitlab.com/jmcantrell/$pkgname"
license=('GPL3')
depends=('btrfs-progs')
checkdepends=('parallel' 'diffutils')
source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('6aaedbb71821408789fde0c223f53fa11bef032df97d9653a1b4b2ccdbaaae01')

check() {
    cd "$srcdir/$pkgname-v$pkgver"
    ./scripts/test
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
    INSTALL_ROOT=$pkgdir/usr ./scripts/install
}
