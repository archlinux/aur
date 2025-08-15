# Maintainer: Oliwier <szerwigi14@gmail.com>
pkgname=brokefetch-git
pkgver=2025.08.12.rc40647b
pkgrel=1
pkgdesc="A broken neofetch clone script 💀 (git version)"
arch=('any')
url="https://github.com/Szerwigi1410/brokefetch"
license=('MIT')
depends=('bash')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    local hash date
    hash=$(git rev-parse --short HEAD)
    date=$(git log -1 --format=%cd --date=format:'%Y.%m.%d')
    echo "${date}.r${hash}"
}

prepare() {
    echo "🧹 Preparing brokefetch script..."
    cp "$srcdir/$pkgname/brokefetch.sh" "$srcdir/"
}

package() {
    echo "📦 Installing brokefetch..."
    install -Dm755 "$srcdir/brokefetch.sh" "$pkgdir/usr/bin/brokefetch"
}

clean() {
    echo "💣 Nuking old build artifacts..."
    rm -f "$PWD"/*.pkg.tar.* "$PWD"/*.log
}

post_install() {
    echo "♻️ Removing any old system binary..."
    if [[ -f /usr/bin/brokefetch ]]; then
        rm -f /usr/bin/brokefetch
    fi
}

post_upgrade() {
    echo "🔄 Updating... removing outdated brokefetch..."
    if [[ -f /usr/bin/brokefetch ]]; then
        rm -f /usr/bin/brokefetch
    fi
}
