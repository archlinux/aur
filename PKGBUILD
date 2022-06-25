# Maintainer: Peter Kaplan <peter@pkap.de>
pkgname=stacktile-git
_pkgname=stacktile
pkgver=r42.0e5baf1
pkgrel=1
pkgdesc="Layout generator for the river Wayland compositor"
arch=('x86_64')
url="https://sr.ht/~leon_plickat/stacktile/"
license=('GPL3')
makedepends=('git' 'wayland')
conflicts=('stacktile')
provides=('stacktile')
options=('!buildflags')
source=("git+https://git.sr.ht/~leon_plickat/stacktile")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$_pkgname"
    make
}

package() {
    cd "$_pkgname"
    make DESTDIR="$pkgdir" PREFIX="/usr" install 
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
