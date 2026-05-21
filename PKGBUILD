# Maintainer: Alexey Babiev <mak.axs@gmail.com>
pkgname=aiman-git
_pkgname=aiman
pkgver=0
pkgrel=1
pkgdesc="Agent Inventory Manager Loadout CLI"
arch=('x86_64' 'aarch64')
url="https://github.com/axsmak/aim"
license=('Apache-2.0')
depends=('glibc')
makedepends=('go' 'git')
provides=('aiman')
conflicts=('aiman')
source=("$_pkgname::git+https://github.com/axsmak/aim.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --tags --match "v[0-9]*" --long 2>/dev/null \
    | sed 's/^v//;s/-/./g' \
    || printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  make build
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 bin/aiman "$pkgdir/usr/bin/aiman"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
