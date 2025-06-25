# Maintainer: strat <strat@jamjar.ws>

pkgname=spicetify-themes-git
pkgver=r509.3effbbe
pkgrel=2
pkgdesc="A community-driven collection of themes for spicetify"
arch=('any')
url="https://github.com/spicetify/spicetify-themes"
license=('MIT')
groups=()
depends=('spicetify-cli')
makedepends=('git')
provides=("spicetify-themes")
conflicts=("spicetify-themes")
replaces=()
backup=()
options=()
install=spicetify-themes-git.install
source=("git+$url")
noextract=()
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/spicetify-themes"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    mkdir -p "$pkgdir/opt/spicetify-cli"
    cp -r --no-preserve=ownership "$srcdir/spicetify-themes" "$pkgdir/opt/spicetify-cli/Themes"

    echo "Removing useless files at top level..."
    find "$pkgdir/opt/spicetify-cli/Themes" -maxdepth 1 \( -name ".*" -o -name "_*" -o -type f \) -exec rm -rfv {} +
    echo "Removing useless files in each theme..."
    find "$pkgdir/opt/spicetify-cli/Themes" -mindepth 2 ! -regex '.*\(\.css\|\.ini\|\.js\|\.woff2\|\.svg\)' -type f -exec rm -fv {} +
    echo "Pruning empty directories..."
    find "$pkgdir/opt/spicetify-cli/Themes" -type d -empty -exec rm -rfv {} +
}
