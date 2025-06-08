# Maintainer: Santiago Burgos <santiago.burgos1089@gmail.com>
# Co-Maintainer: Mark Wagie <mark dot wagie at proton dot me>

pkgname=fingwit
pkgver=1.0.1
pkgrel=3
pkgdesc="Fingerprint Configuration Tool"
url="https://github.com/xapp-project/fingwit"
arch=(any)
license=(GPL-3.0-or-later)
depends=(
    'fprintd'
    'gtk3'
    'libfprint'
    'pam'
    'python'
    'python-gobject'
    'python-setproctitle'
    'xapp'
)
makedepends=(
    'meson'
    'ninja'
)
source=("${pkgname}_${pkgver}.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('9fd3513794464e9a1a7ff584a233a6c6b366b32c8d45d7455d18c48b3a2b01ec')

prepare(){
    cd $pkgname-$pkgver
    # Fix license path
    # Dialog expands too wide
#    sed -i 's|common-licenses/GPL|licenses/spdx/GPL-3.0-or-later.txt|g' "$pkgname"
}

build() {
    arch-meson "$pkgname-$pkgver" build
    meson compile -C build
}

package() {
    meson install -C build --no-rebuild --destdir "$pkgdir"
}
