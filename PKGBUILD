# Maintainer: Genki Sky <alt+archlinux.org@genki.is>

pkgname=wlstream-git
pkgver=20180715.182076a
pkgrel=1
pkgdesc='Video capture for Wayland'
arch=('x86_64')
url='https://github.com/atomnuker/wlstream'
license=('MIT')
depends=('cairo' 'wayland')
makedepends=('git' 'meson' 'scdoc' 'wayland-protocols')
provides=('wlstream')
conflicts=('wlstream')
source=('git+https://github.com/atomnuker/wlstream')
sha256sums=('SKIP')

pkgver() {
    cd wlstream
    git log -1 --format='%cd.%h' --date=short | tr -d -
}

build() {
    cd wlstream
    meson --prefix=/usr build
    ninja -C build
}

package() {
    cd wlstream
    DESTDIR="$pkgdir" ninja -C build install
    install -D -m 0644 LICENSE "$pkgdir"/usr/share/licenses/wlstream/LICENSE
    install -D -m 0644 README.md "$pkgdir"/usr/share/doc/wlstream/README.md
}
