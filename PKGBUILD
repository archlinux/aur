# Maintainer: Santiago Burgos <santiago.burgos1089@gmail.com>
# Co-Maintainer: Mark Wagie <mark dot wagie at proton dot me>

pkgname=fingwit
pkgver=1.0.7
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
    'xapp-symbolic-icons'
)
makedepends=(
    'meson'
    'ninja'
)
source=("${pkgname}_${pkgver}.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('4d34e1904d5f520642c772b9c4acf74038101c2f714cc48e03e79b39dd8ff5fc')

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
