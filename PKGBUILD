# Maintainer: Lyssten <131473921+Lyssten@users.noreply.github.com>
pkgname=retypex-git
pkgver=r1.unknown
pkgrel=2
pkgdesc="Switch keyboard layout of the last typed word or selected text on Wayland/Hyprland"
arch=('x86_64')
url="https://github.com/Lyssten/retypex"
license=('MIT')
depends=('wl-clipboard')
optdepends=('wtype: for selection mode output (types text natively on Wayland)')
makedepends=('gcc' 'git')
provides=('retypex')
conflicts=('retypex')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname"
    make PREFIX=/usr
}

package() {
    cd "$pkgname"
    make PREFIX=/usr DESTDIR="$pkgdir" install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
