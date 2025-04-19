# Maintainer: Electria
pkgname=btwrap-git
pkgver=r107.0646382
pkgrel=1
pkgdesc="Shell wrapper for managing BTRFS snapshots"
arch=(any)
url="https://github.com/Elec3137/btwrap"
license=('GPL-3.0-or-later')
depends=('gawk' 'systemd' 'sudo' 'btrfs-progs' 'grep')
makedepends=('git')
conflicts=('btwrap')
provides=('btwrap')
optdepends=(
    'grub-btrfs: to add root snapshots into your grub bootmenu'
)

source=("git+https://github.com/Elec3137/btwrap#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd btwrap
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
    cd "$srcdir"
    install -d "$pkgdir/usr/bin/"
    cp btwrap/btwrap "$pkgdir/usr/bin/"

    install -d "$pkgdir/etc/systemd/system/"
    cp btwrap/btwrap.timer "$pkgdir/etc/systemd/system/"
    cp btwrap/btwrap.service "$pkgdir/etc/systemd/system/"

    install -d "$pkgdir/usr/share/libalpm/hooks"
    cp btwrap/btwrap-snapshot-cycle.hook "$pkgdir/usr/share/libalpm/hooks/"
}
