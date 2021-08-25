# Maintainer: Jeremy Cantrell <jmcantrell at gmail dot com>

pkgname=btrfs-snapshots
pkgver=0.2.0
pkgrel=1
pkgdesc="Manage collections of btrfs snapshots"
arch=('any')
url="https://gitlab.com/jmcantrell/$pkgname"
license=('GPL3')
depends=('btrfs-progs')
source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('8be096b3c5d07f1fb22086b1da8b54cae8994c3219e7707c308067731855ef28')

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
