# Maintainer: Peter Kaplan <peter@pkap.de>
pkgname=lswt-git
_pkgname=lswt
pkgver=r41.09dc3de
pkgrel=1
pkgdesc="List Wayland toplevels"
arch=('x86_64')
url="https://git.sr.ht/~leon_plickat/lswt"
license=('GPL3')
depends=("wayland")
conflicts=("lswt")
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$_pkgname"
    make DESTDIR="$pkgdir" PREFIX="/usr"
}

package() {
    cd "$_pkgname"
    make DESTDIR="$pkgdir" PREFIX="/usr" install 
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
