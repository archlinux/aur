# Maintainer: Electria
pkgname=buttercup-git
_pkgname=buttercup
pkgver=r8.2f80a19
pkgrel=1
pkgdesc="script and hook to automate snapshot cycling as well as making incremental backups easy"
arch=(any)
url="https://github.com/Elec3137/$_pkgname"
license=('GPL-3.0-or-later')
depends=('sudo' 'btrfs-progs' 'grep' 'fish')
makedepends=('git')
conflicts=('buttercup')
provides=('buttercup')
optdepends=(
    'grub-btrfs: to add root snapshots into your grub bootmenu'
)

source=("git+https://github.com/Elec3137/$_pkgname#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
    cd "$srcdir/$_pkgname"
    install -d "$pkgdir/usr/bin/"
    cp buttercup "$pkgdir/usr/bin/"

    install -d "$pkgdir/usr/share/libalpm/hooks"
    cp buttercup-snapshot-cycle.hook "$pkgdir/usr/share/libalpm/hooks/"
}
