# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=tau-editor
pkgver=0.10.2
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
source=("https://gitlab.gnome.org/World/Tau/uploads/d7d7fc22a851466768edeace0f3d6b1b/tau-0.10.2.tar.xz")
sha256sums=('14551674458d1011cfb06152313b1be647aa4e47a8278f8fde57a754a05206b3')


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
