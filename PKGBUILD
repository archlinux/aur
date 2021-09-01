# Maintainer: Jeremy Cantrell <jmcantrell at gmail dot com>

pkgname=btrfs-snapshots
pkgver=0.5.0
pkgrel=1
pkgdesc="Manage timestamped collections of btrfs snapshots"
arch=('any')
url="https://gitlab.com/jmcantrell/$pkgname"
license=('GPL3')
depends=('btrfs-progs')
checkdepends=('parallel' 'diffutils')
source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('10f9de816093931471e60bc5958610e2777a4b4687d5c1047da4f0053e8fb0f0')

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
