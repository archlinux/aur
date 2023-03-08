# Maintainer: trilader <trilader@schroedingers-bit.net>
pkgname=termpaint-git
pkgver=r499.3823173
pkgrel=1
pkgdesc="low level terminal interface library"
arch=("x86_64")
url="https://github.com/termpaint/termpaint"
license=('Boost')
depends=()
makedepends=(meson)
options=(!strip)
source=("git+https://github.com/termpaint/termpaint.git")
md5sums=("SKIP")

pkgver() {
    cd "termpaint"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    arch-meson -Ddefault_library=both termpaint _build
}

check() {
    meson test -C _build
}

package() {
    DESTDIR="$pkgdir" meson install -C _build
}
