# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=tau-editor
pkgver=0.10.1
pkgrel=1
pkgdesc="GTK frontend for the Xi text editor, written in Rust"
arch=(i686 x86_64 armv6h armv7h)
url="https://gitlab.gnome.org/World/tau"
license=('MIT')
depends=('xi-core'
         'libhandy')
makedepends=('git'
             'meson'
             'rust')
provides=("tau-editor")
conflicts=("tau-editor")
source=("https://gitlab.gnome.org/World/Tau/uploads/25d33d736285ad451bc7b409aa01e957/tau-0.10.1.tar.xz")
sha256sums=('e97e848481e5a35ff6b9d5708e017c2d59a4d2ccc26fb5267fa0418ac060dc91')


build() {
    arch-meson -Dxi-core=system -Dlibhandy=enabled "tau-${pkgver}" build
    ninja -C build
}

# check() {
#     ninja -C build test
# }

package() {
    DESTDIR="$pkgdir/" ninja -C build install
    install -Dm 644 "tau-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
