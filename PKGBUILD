# Maintainer: Carson Black <uhhadd AT gmail DOT com>
pkgname=taigo
pkgver=0.3
pkgrel=1
pkgdesc="A virtual pet for your desktop built with GTK+, Vala, and love"
arch=(any)

url="https://github.com/Appadeia/taigo"
license=("GPL")

depends=(
    "gtk3" "clutter"
)
makedepends=(
    "vala" "meson"
)

source=("$pkgname-$pkgver.tar.gz::https://github.com/Appadeia/$pkgname/archive/$pkgver.tar.gz")
md5sums=('0cdf727a9f419365106bd5c77006af6e')

build() {
    cd "$pkgname-$pkgver"
    arch-meson build
    ninja -C build
}

package() {
    cd "$pkgname-$pkgver"
    DESTDIR="$pkgdir" meson install -C build
    install -Dm 644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
