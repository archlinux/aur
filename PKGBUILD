# Maintainer: Mike Yuan <me@yhndnzj.com>

pkgname=btrfs-snapshot
pkgver=1.1.1
pkgrel=4
pkgdesc="Tool for creating btrfs snapshots"
arch=('any')
url="https://github.com/YHNdnzj/btrfs-snapshot"
license=('MIT')
depends=('bash' 'btrfs-progs')
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('b9361f4c8bdcfa60936ddd09f7b36cb47bdd7d796fa90f8eaf798e4b7e69a3b9')

package() {
    cd "$pkgname-$pkgver"

    sed -e 's|\(^_f_parseopts\)=.*|\1=/usr/lib/btrfs-snapshot-po|' \
        -e "s|VERSION|$pkgver|g" \
        -i btrfs-snapshot

    install -dm755 "$pkgdir"/usr/{bin,lib/systemd/system}

    install -Dm755 btrfs-snapshot "$pkgdir"/usr/bin/btrfs-snapshot
    install -Dm644 parseopts "$pkgdir"/usr/lib/btrfs-snapshot-po

    install -Dt "$pkgdir"/usr/lib/systemd/system -m644 systemd/btrfs-snapshot@.{service,timer}
}

# vim: set ts=4 sw=4 et:
