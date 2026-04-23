# Maintainer: Timothy Beach <beachtimothyd@gmail.com>

pkgname=dmenu-aegix-git
_pkgname=dmenu
pkgver=r4.1d3b110
pkgrel=1
pkgdesc="Aegix Linux's custom build of dmenu (dynamic menu) with aegix-flavored config; ships dmenu, dmenu_path, dmenu_run, and stest"
arch=('x86_64')
url="https://github.com/aegixlinux/dmenu"
license=('MIT')
depends=('libx11' 'libxft' 'libxinerama' 'freetype2' 'fontconfig')
makedepends=('git')
provides=('dmenu')
conflicts=('dmenu')
source=("$_pkgname::git+https://github.com/aegixlinux/dmenu.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$_pkgname"
    make PREFIX=/usr
}

package() {
    cd "$_pkgname"
    make PREFIX=/usr DESTDIR="$pkgdir" install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
