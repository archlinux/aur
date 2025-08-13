# Maintainer: Oliwier <szerwigi14@gmail.com>
pkgname=brokefetch-git
pkgver=2025.08.12.r0.0000000
pkgrel=1
pkgdesc="A broken neofetch clone script 💀"
arch=('any')
url="https://github.com/Szerwigi1410/brokefetch"
license=('MIT')
depends=('bash')
makedepends=('git' 'curl')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    # Get latest commit info
    local date=$(git log -1 --format="%cs" | tr - .)
    local rev=$(git rev-list --count HEAD)
    local hash=$(git rev-parse --short HEAD)
    echo "${date}.r${rev}.${hash}"
}

prepare() {
    echo "🔥 Nuking old script..."
    rm -f "$srcdir/brokefetch.sh"

    echo "⬇️ Fetching latest brokefetch.sh..."
    curl -L "https://raw.githubusercontent.com/Szerwigi1410/brokefetch/main/brokefetch.sh" \
        -o "$srcdir/brokefetch.sh"
}

package() {
    install -Dm755 "$srcdir/brokefetch.sh" "$pkgdir/usr/bin/brokefetch"
}
