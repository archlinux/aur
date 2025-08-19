# Maintainer: Electria
pkgname=buttercup-git
_pkgname=buttercup
pkgver=r24.de00d5b
pkgrel=1
pkgdesc="script and hook to automate snapshot cycling as well as making incremental backups easy"
arch=(any)
url="https://github.com/Elec3137/$_pkgname"
license=('GPL-3.0-or-later')
depends=('fish' 'sudo' 'btrfs-progs' 'grep' 'coreutils')
makedepends=('git')
conflicts=('buttercup' 'btwrap')
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
    cp buttercup-grub-mkconfig.hook "$pkgdir/usr/share/libalpm/hooks/"
}
