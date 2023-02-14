# Maintainer: trilader <trilader@schroedingers-bit.net>
pkgname=termpaint-git
pkgver=r497.dc29355
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
    #arch-meson -Ddefault_library=static termpaint _build
    # This is "the good stuff" from the arch-meson script
    meson setup --prefix /usr --libexecdir lib --sbindir bin --wrap-mode nodownload -Db_lot=true -Db_pie=true -Ddefault_library=static termpaint _build
    meson compile -C _build
}

check() {
    meson test -C _build
}

package() {
    DESTDIR="$pkgdir" meson install -C _build
}
