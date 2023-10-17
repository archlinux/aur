# Maintainer: Riderius <riderius.help@gmail.com>
# Previous maintainer: Kevin Kuehler <keur@xcf.berkeley.edu>

pkgname='git-quick-stats'
pkgver='2.5.2'
pkgrel=1
pkgdesc='Simple and efficient way to access various statistics in git repository'
arch=('any')
url="https://github.com/arzzen/$pkgname"
license=('MIT')
depends=(
  'bash'
  'coreutils'
  'gawk'
  'git'
  'grep'
  'ncurses'
  'util-linux'
)
makedepends=()
provides=('git-quick-stats')
conflicts=('git-quick-stats')
source=("$pkgname::git+$url#tag=$pkgver"
        "$pkgname-timezone-fix-1.patch::https://patch-diff.githubusercontent.com/raw/arzzen/git-quick-stats/pull/142.patch")
sha256sums=('SKIP'
            '59190da26955b010db03e293be4724629a10b9e8efa447b3f647128c8b3fc56d')

prepare() {
    cd "$srcdir/$pkgname"
    git apply "${srcdir}"/142.patch
}

check() {
  cd "$srcdir/$pkgname"
  make test
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" PREFIX=/usr install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
