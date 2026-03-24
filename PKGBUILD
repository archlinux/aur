# Maintainer: Vokun Contributors
pkgname=vokun
pkgver=0.3.0
pkgrel=1
pkgdesc="Task-oriented package bundle manager for Arch Linux"
arch=('any')
url="https://github.com/blacktechwarrior/vokun"
license=('MIT')
depends=('bash' 'pacman')
optdepends=(
    'paru: AUR support (preferred)'
    'yay: AUR support (alternative)'
    'fzf: interactive fuzzy picker'
    'jq: JSON state tracking'
    'pacman-contrib: cache management (paccache)'
)
install=vokun.install
makedepends=('git')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --tags --long 2>/dev/null | sed 's/^v//;s/-/.r/;s/-/./' ||
        printf "0.1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$pkgname"
    make install DESTDIR="$pkgdir" PREFIX=/usr
}
