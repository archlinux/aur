# Maintainer: Krzysztof Demir Kuźniak <krzysztofdemirkuzniak@gmail.com>
pkgname=kuznix-tui-de-git
pkgver=0.1.0.r20250922
pkgrel=1
pkgdesc="A TUI Desktop for Kuznix GNU/Linux (development Git version)"
arch=('x86_64')
url="https://github.com/KuznixTeam/kuznix-tui-de"
license=('GPL')
depends=('ncurses')
makedepends=('meson' 'gcc' 'ncurses')
source=("git+https://github.com/KuznixTeam/kuznix-tui-de.git")
md5sums=('SKIP')  # Git source, skip checksum

pkgver() {
    cd "$srcdir/kuznix-tui-de"
    echo "0.1.0.r$(date -d "$(git log -1 --format=%ci)" +%Y%m%d)"
}

build() {
    cd "$srcdir/kuznix-tui-de"
    meson setup build
    meson compile -C build
}

package() {
    cd "$srcdir/kuznix-tui-de"
    install -Dm755 build/kuznix-tui-de "$pkgdir/usr/bin/kuznix-tui-de"
}
