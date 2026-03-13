# Maintainer: fa5e4658010be730
pkgname=btrfs-file-history-git
pkgver=r4.004054a
pkgrel=1
pkgdesc="Track file and directory lifecycle across btrfs snapshots"
arch=('any')
url="https://gitlab.com/fkzys/btrfs-file-history"
license=('AGPL-3.0-or-later')
depends=('python' 'btrfs-progs' 'util-linux')
optdepends=(
    'e2fsprogs: extent analysis via filefrag'
    'python-graphviz: Graphviz dot export'
)
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$pkgname"
    make DESTDIR="$pkgdir" PREFIX=/usr install
}
