# Maintainer: J A <soulhotel@pm.me>
pkgname=paruse
pkgver=0.7.31d7fdb
pkgrel=1
pkgdesc="An interactive package manager and browser using paru and fzf"
arch=('any')
url="https://github.com/soulhotel/paruse"
license=('MIT')
makedepends=(git)
depends=(paru fzf bash)
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    local tag=$(git describe --tags --abbrev=0 2>/dev/null || echo "0.0")
    local commit=$(git log -1 --format="%h" -- paruse.sh)
    [ -z "$commit" ] && commit=$(git rev-parse --short HEAD)
    printf "%s.%s" "$tag" "$commit"
}

package() {
    install -Dm755 "$srcdir/$pkgname/paruse.sh" "$pkgdir/usr/bin/paruse"
    install -Dm644 "$srcdir/$pkgname/pkg/paruse.desktop" "$pkgdir/usr/share/applications/paruse.desktop"
    install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
