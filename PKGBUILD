# Maintainer: Jeremy Cantrell <jmcantrell at gmail dot com>

pkgname=btrfs-snapshots
pkgver=0.1.1
pkgrel=3
pkgdesc="Manage collections of btrfs snapshots"
arch=('any')
url="https://gitlab.com/jmcantrell/$pkgname"
license=('GPL3')
depends=('btrfs-progs')
source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('d0415ad5abdda78d972a2e129d70d82d4d36e44d098061f77bf50122484cc57b')

check() {
    cd "$srcdir/$pkgname-v$pkgver"
    make -k check
}

prepare() {
    local file
    while read -r file; do
        sed -i "\:/usr/local/etc:s:/usr/local::g" "$file"
        sed -i "\:/usr/local:s:/usr/local:/usr:g" "$file"
    done < <(find "$srcdir/${pkgname%-git}" -type f)
}

package() {
    cd "$srcdir/$pkgname-v$pkgver"
    INSTALL_ROOT=$pkgdir/usr make install
}
