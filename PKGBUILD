# Maintainer: Mike Yuan <me@yhndnzj.com>

pkgname=btrfs-snapshot
pkgver=1.2.0
pkgrel=2
pkgdesc="Tool for creating btrfs snapshots"
arch=('any')
url="https://github.com/YHNdnzj/btrfs-snapshot"
license=('MIT')
depends=('bash' 'btrfs-progs')
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('fb7205dbcd514b208f0df49d76835f6b7282f169be40ac2dccc2d9a3d9435789')

package() {
    cd "$pkgname-$pkgver"

    sed -e 's|\(^_f_parseopts\)=.*|\1=/usr/lib/btrfs-snapshot-po|' \
        -e "s|VERSION|$pkgver|g" \
        -i btrfs-snapshot

    install -dm755 "$pkgdir"/usr/{bin,lib/systemd/system,share/doc/btrfs-snapshot}

    install -Dm755 btrfs-snapshot "$pkgdir"/usr/bin/btrfs-snapshot
    install -Dm644 parseopts "$pkgdir"/usr/lib/btrfs-snapshot-po

    install -Dt "$pkgdir"/usr/lib/systemd/system -m644 systemd/btrfs-snapshot@.{service,timer}

    install -Dm644 README.md "$pkgdir"/usr/share/doc/btrfs-snapshot/README.md
}

# vim: set ts=4 sw=4 et:
