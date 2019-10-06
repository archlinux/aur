# Maintainer: Mike Yuan <me@yhndnzj.com>

pkgname=btrfs-snapshot
pkgver=1.3.0
pkgrel=1
pkgdesc="Tool for creating btrfs snapshots"
arch=('any')
url="https://github.com/YHNdnzj/btrfs-snapshot"
license=('MIT')
depends=('bash' 'btrfs-progs')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('c4c5abb4a5920e1e75f220a8e22dccc6defc4142601b1bf6a36a9c44b8e3bf77')

package() {
    cd "$pkgname-$pkgver"

    sed -e 's|\(^_f_parseopts\)=.*|\1=/usr/lib/btrfs-snapshot-po|' \
        -e "s|VERSION|${pkgver}|g" \
        -i btrfs-snapshot

    install -Dm755 btrfs-snapshot "${pkgdir}"/usr/bin/btrfs-snapshot
    install -Dm644 parseopts "${pkgdir}"/usr/lib/btrfs-snapshot-po

    install -Dt "${pkgdir}"/usr/lib/systemd/system -m644 systemd/btrfs-snapshot@.{service,timer}

    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: set ts=4 sw=4 et:
