# Maintainer: Mike Yuan <me@yhndnzj.com>

pkgname=btrfs-snapshot
pkgver=2.0.0
pkgrel=1
pkgdesc="Tool for creating btrfs snapshots"
arch=('any')
url="https://github.com/YHNdnzj/btrfs-snapshot"
license=('MIT')
depends=('bash' 'btrfs-progs')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('eb2094dd68a464a6d80d53be3251834fad6fed45de5c42004608a09801f5da03')

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
