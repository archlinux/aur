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
    if git describe --tags --long 2>/dev/null | grep -q .; then
        git describe --tags --long | sed 's/^v//;s/-/.r/;s/-/./'
    else
        printf "0.3.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    fi
}

package() {
    cd "$pkgname"
    make install DESTDIR="$pkgdir" PREFIX=/usr
}
