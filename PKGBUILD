# Maintainer: Mike Yuan <me@yhndnzj.com>

pkgname=btrfs-snapshot
pkgver=3.1.1
pkgrel=1
pkgdesc="Tool for creating btrfs snapshots"
arch=('any')
url="https://github.com/YHNdnzj/btrfs-snapshot"
license=('MIT')
depends=('bash' 'btrfs-progs')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('7aed2dff1399873bce62812e35840499d95fb320fba44c37ceb3e2cfeed8bf9e')

package() {
    cd "$pkgname-$pkgver"

    sed "s|\(^_f_parseopts\)=.*|\1=/usr/lib/btrfs-snapshot-po|
         s|\(^_d_config\)=.*|\1=/etc/btrfs-snapshot|
         s|%VERSION%|$pkgver|g" \
         btrfs-snapshot | install -Dm755 /dev/stdin \
         "$pkgdir/usr/bin/btrfs-snapshot"

    install -Dm644 parseopts "$pkgdir/usr/lib/btrfs-snapshot-po"
    install -dm755 "$pkgdir/etc/btrfs-snapshot"

    install -Dt "$pkgdir/usr/lib/systemd/system" -m644 btrfs-snapshot@.{service,timer}

    install -Dm644 README.md "$pkgdir/usr/share/doc/btrfs-snapshot/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/btrfs-snapshot/LICENSE"
 
}

# vim: set ts=4 sw=4 et:
