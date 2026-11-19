# Maintainer: Joki <jokitm at outlook dot com>
pkgname=alphabat-git
_pkgname=alphabat
pkgver=r19.895b82b
pkgrel=1
pkgdesc="Battery status for HyperX Cloud Alpha Wireless headsets"
arch=('x86_64')
url="https://github.com/JokiTM/alphabat"
license=('GPL-3.0-or-later' 'MIT')
depends=()
makedepends=('go' 'git')
source=(
    "$_pkgname::git+${url}.git"
    "99-hyprx.rules"
)
sha256sums=('SKIP' 'SKIP')
validpgpkeys=()

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd "$_pkgname"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    go build
}

package() {
	cd "$_pkgname"
    install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 "LICENSES/GPL-3.0-or-later.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENCE"
    install -Dm644 "LICENSES/MIT.txt"  "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
    install -Dm644 "$srcdir/99-hyprx.rules" "$pkgdir/usr/lib/udev/rules.d/99-hyprx.rules"
}
