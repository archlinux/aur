# Maintainer: Mike Yuan <me@yhndnzj.com>

pkgname=btrfs-snapshot
pkgver=3.3.4
pkgrel=1
pkgdesc="Tool for creating btrfs snapshots"
arch=('any')
url="https://github.com/YHNdnzj/btrfs-snapshot"
license=('MIT')
depends=('bash' 'btrfs-progs')
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('78a50f0e6cb9c0c5c21b68b3f7dd64f836706493182e6d4eec47e5c384fdde82')

prepare() {
    cd "$pkgname-$pkgver"

    sed -e 's|\(^_f_functions\)=.*|\1=/usr/lib/btrfs-snapshot/functions|' \
        -e 's|\(^_d_configs\)=.*|\1=/etc/btrfs-snapshot|' \
        -e "s|%VERSION%|$pkgver|g" \
        -i btrfs-snapshot
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm755 btrfs-snapshot "$pkgdir/usr/bin/btrfs-snapshot"

    install -Dm644 functions "$pkgdir/usr/lib/btrfs-snapshot/functions"
    install -dm755 "$pkgdir/etc/btrfs-snapshot"

    install -Dt "$pkgdir/usr/lib/systemd/system" -m644 btrfs-snapshot{,@}.{service,timer}

    install -Dm644 README.md "$pkgdir/usr/share/doc/btrfs-snapshot/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/btrfs-snapshot/LICENSE"
}

# vim: set ts=4 sw=4 et:
