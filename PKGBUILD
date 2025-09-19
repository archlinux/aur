# Maintainer: Santiago Burgos <santiago.burgos1089@gmail.com>
# Co-Maintainer: Mark Wagie <mark dot wagie at proton dot me>

pkgname=fingwit
pkgver=1.0.5
pkgrel=1
pkgdesc="Fingerprint Configuration Tool"
url="https://github.com/xapp-project/fingwit"
arch=('x86_64')
license=('GPL-3.0-or-later')
depends=(
    'audit'
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
sha256sums=('46176a0cb107a64c8303b8dc350f3ee2510169ddc06b16d97d3879c81d3cf90b')

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
