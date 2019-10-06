# Maintainer: Mike Yuan <me@yhndnzj.com>

pkgname=btrfs-snapshot
pkgver=1.2.1
pkgrel=2
pkgdesc="Tool for creating btrfs snapshots"
arch=('any')
url="https://github.com/YHNdnzj/btrfs-snapshot"
license=('MIT')
depends=('bash' 'btrfs-progs')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('055727fba0ca5ecb6e72103d3447818a583a0b5e918c3a5a403a1f35ba5fd722')

package() {
    cd "$pkgname-$pkgver"

    sed -e 's|\(^_f_parseopts\)=.*|\1=/usr/lib/btrfs-snapshot-po|' \
        -e "s|VERSION|${pkgver}|g" \
        -i btrfs-snapshot

    install -Dm755 btrfs-snapshot "${pkgdir}"/usr/bin/btrfs-snapshot
    install -Dm644 parseopts "${pkgdir}"/usr/lib/btrfs-snapshot-po

    install -Dt "${pkgdir}"/usr/lib/systemd/system -m644 systemd/btrfs-snapshot@.{service,timer}

    install -Dm644 README.md "${pkgdir}/usr/share/doc/${_srcname}/README.md"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_srcname}/LICENSE"
}

# vim: set ts=4 sw=4 et:
