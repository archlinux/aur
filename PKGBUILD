# Maintainer: Santiago Burgos <santiago.burgos1089@gmail.com>

pkgname=fingwit
pkgver=1.0.1
pkgrel=1
pkgdesc="Fingerprint Configuration Tool"
url="https://github.com/xapp-project/fingwit"
arch=(x86_64)
license=(GPL-3.0-or-later)
depends=(
    'fprintd'
    'gobject-introspection'
    'gtk3'
    'libfprint'
    'pam'
    'python'
)
makedepends=(
    'appstream-glib'
    'meson'
    'ninja'
)
source=("${pkgname}_${pkgver}.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('9fd3513794464e9a1a7ff584a233a6c6b366b32c8d45d7455d18c48b3a2b01ec')

prepare(){
    cd $pkgname-$pkgver
}

build() {
    arch-meson "$pkgname-$pkgver" build
    meson compile -C build
}

package() {
    meson install -C build --destdir "$pkgdir"
}
