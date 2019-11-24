# Maintainer: Mike Yuan <me@yhndnzj.com>

pkgname=btrfs-snapshot
pkgver=3.3.2
pkgrel=1
pkgdesc="Tool for creating btrfs snapshots"
arch=('any')
url="https://github.com/YHNdnzj/btrfs-snapshot"
license=('MIT')
depends=('bash' 'btrfs-progs')
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('9a51bc8dfa9effd692da9449d0bc6275707784387703d6277d0695564937b0c7')

package() {
    cd "$pkgname-$pkgver"

    sed "s|\(^_f_functions\)=.*|\1=/usr/lib/btrfs-snapshot/functions|
         s|\(^_d_configs\)=.*|\1=/etc/btrfs-snapshot|
         s|%VERSION%|$pkgver|g" \
            btrfs-snapshot | install -Dm755 /dev/stdin \
                "$pkgdir/usr/bin/btrfs-snapshot"

    install -Dm644 functions "$pkgdir/usr/lib/btrfs-snapshot/functions"
    install -dm755 "$pkgdir/etc/btrfs-snapshot"

    install -Dt "$pkgdir/usr/lib/systemd/system" -m644 btrfs-snapshot{,@}.{service,timer}

    install -Dm644 README.md "$pkgdir/usr/share/doc/btrfs-snapshot/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/btrfs-snapshot/LICENSE"
}

# vim: set ts=4 sw=4 et:
