# Maintainer: aethstetic <aethstetic@users.noreply.github.com>
pkgname=vex-shell-git
_pkgname=vex
pkgver=r1
pkgrel=1
pkgdesc='A typed shell with structured data pipelines, written in C'
arch=('x86_64' 'aarch64')
url='https://github.com/aethstetic/vex'
license=('MIT')
depends=('glibc')
makedepends=('git')
provides=('vex-shell')
conflicts=('vex-shell')
source=("git+$url.git")
sha256sums=('SKIP')
install=vex.install

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
    make DESTDIR="$pkgdir" PREFIX=/usr install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
