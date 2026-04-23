# Maintainer: Timothy Beach <beachtimothyd@gmail.com>

pkgname=dwm-aegix-git
_pkgname=dwm
pkgver=r28.7e7400d
pkgrel=1
pkgdesc="Aegix Linux's custom build of dwm (dynamic window manager) with menu button, gaps, dark scheme, and aegix-flavored config"
arch=('x86_64')
url="https://github.com/aegixlinux/dwm"
license=('MIT')
depends=('libx11' 'libxft' 'libxinerama' 'freetype2' 'fontconfig')
makedepends=('git')
provides=('dwm')
conflicts=('dwm')
source=("$_pkgname::git+https://github.com/aegixlinux/dwm.git")
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
