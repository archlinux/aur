# Maintainer: Mike Yuan <me@yhndnzj.com>

pkgname=btrfs-snapshot-git
_srcname=btrfs-snapshot
pkgver=1.0.0.r0.gdf33f43
pkgrel=1
pkgdesc="Tool for creating btrfs snapshots"
arch=('any')
url="https://github.com/YHNdnzj/btrfs-snapshot"
license=('MIT')
depends=('bash' 'btrfs-progs')
optdepends=('systemd: Daily create snapshots')
source=("git+https://github.com/YHNdnzj/$_srcname.git")
md5sums=('SKIP')

pkgver() {
    cd "${_srcname}"
    git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
    cd "${_srcname}"

    sed \
        -e 's|\(^_f_parseopts\)=.*|\1=/usr/lib/btrfs-snapshot/parseopts|' \
        -i btrfs-snapshot.sh
    install -Dm755 btrfs-snapshot.sh "${pkgdir}"/usr/bin/btrfs-snapshot

    install -dm644 "${pkgdir}"/usr/lib/btrfs-snapshot
    install -Dt ${pkgdir}/usr/lib/systemd/system -m644 systemd/*
}

# vim: set ts=4 sw=4 et:
