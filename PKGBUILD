pkgname=slurp-git
pkgver=20200407.8d2117c
pkgrel=1
pkgdesc='Select a region in a Wayland compositor'
arch=('x86_64')
url='https://github.com/emersion/slurp'
license=('MIT')
depends=('cairo' 'wayland')
makedepends=('git' 'meson' 'scdoc' 'wayland-protocols')
provides=('slurp')
conflicts=('slurp')
source=('git+https://github.com/emersion/slurp')
sha256sums=('SKIP')

pkgver() {
    cd slurp
    git log -1 --format='%cd.%h' --date=short | tr -d -
}

build() {
    cd slurp
    meson \
        --prefix=/usr \
        --buildtype release \
        build
    ninja -C build
}

package() {
    cd slurp
    DESTDIR="$pkgdir" ninja -C build install
    install -D -m 0644 LICENSE "$pkgdir"/usr/share/licenses/slurp/LICENSE
    install -D -m 0644 README.md "$pkgdir"/usr/share/doc/slurp/README.md
}
