# Maintainer: Mike Yuan <me@yhndnzj.com>

pkgname=btrfs-snapshot
pkgver=3.2.1
pkgrel=1
pkgdesc="Tool for creating btrfs snapshots"
arch=('any')
url="https://github.com/YHNdnzj/btrfs-snapshot"
license=('MIT')
depends=('bash' 'btrfs-progs')
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('7f7759ad4c156da45c428c993995bc073497933100e47bfa961b6b535519c486')

package() {
    cd "$pkgname-$pkgver"

    sed "s|\(^_f_parseopts\)=.*|\1=/usr/lib/btrfs-snapshot-po|
         s|\(^_d_config\)=.*|\1=/etc/btrfs-snapshot|
         s|%VERSION%|$pkgver|g" \
        btrfs-snapshot | install -Dm755 /dev/stdin \
        "$pkgdir/usr/bin/btrfs-snapshot"

    install -Dm644 parseopts "$pkgdir/usr/lib/btrfs-snapshot-po"
    install -dm755 "$pkgdir/etc/btrfs-snapshot"

    install -Dt "$pkgdir/usr/lib/systemd/system" -m644 btrfs-snapshot.{service,timer}

    install -Dm644 README.md "$pkgdir/usr/share/doc/btrfs-snapshot/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/btrfs-snapshot/LICENSE"

    chmod -Rc u=rwX,go=rX "$pkgdir"
}

# vim: set ts=4 sw=4 et:
