# Maintainer: YourName <you@example.com>
pkgname=brokefetch-git
pkgver=2025.08.12.rc40647b
pkgrel=1
pkgdesc="A broken neofetch clone script 💀"
arch=('any')
url="https://github.com/Szerwigi1410/brokefetch"
license=('MIT')
depends=('bash')
source=()
sha256sums=()

# Nuke old built packages right away
echo "🔥 Nuking old package archives..."
rm -f "$PWD"/*.pkg.tar.*

pkgver() {
    # Get latest commit hash
    local hash
    hash=$(git ls-remote "$url" HEAD | cut -f1 | cut -c1-7)

    # Get latest commit date in YYYY.MM.DD format
    local date
    date=$(curl -s "https://api.github.com/repos/Szerwigi1410/brokefetch/commits" \
        | grep '"date"' \
        | head -n 1 \
        | cut -d'"' -f4 \
        | cut -d'T' -f1 \
        | tr - .)

    echo "${date}.r${hash}"
}

prepare() {
    echo "🧹 Removing old script..."
    rm -f "$srcdir/brokefetch.sh"

    echo "⬇️ Fetching latest brokefetch.sh..."
    curl -L "https://raw.githubusercontent.com/Szerwigi1410/brokefetch/main/brokefetch.sh" \
        -o "$srcdir/brokefetch.sh"
}

package() {
    install -Dm755 "$srcdir/brokefetch.sh" "$pkgdir/usr/bin/brokefetch"
}





