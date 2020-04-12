# Maintainer: Vlad Petrov <ejiek@mail.ru>

pkgname=kgx
pkgver=0.2.1
pkgrel=1
pkgdesc="A minimal terminal for GNOME"
url="https://gitlab.gnome.org/ZanderBrown/kgx"
license=("GPL3")
arch=(i686 x86_64 armv6h armv7h aarch64)
depends=(vte3
         gtk3
         glib2
         libgtop)
makedepends=(
             meson
             )
conflicts=(kgx)
source=("https://gitlab.gnome.org/ZanderBrown/kgx/-/archive/${pkgver}/kgx-${pkgver}.tar.gz")
sha256sums=('70a814b0baf70049d5a20791d58a32e92661428d2deeeb56d91b81cc4dc5e81a')

build() {
    rm -rf build
    arch-meson kgx-${pkgver} build
    ninja -C build
}

check() {
    ninja -C build test
}

package() {
    DESTDIR="${pkgdir}" ninja -C build install
}
