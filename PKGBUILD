# Maintainer: Alisson Lauffer <alissonvitortc@gmail.com>

pkgname=telegrand-git
pkgver=r173.9c1cb51
pkgrel=1
pkgdesc='A GTK4 telegram client built to be well integrated with the GNOME desktop environment.'
arch=('x86_64' 'i686')
url='https://github.com/melix99/telegrand'
depends=('gtk4' 'libadwaita-git' 'telegram-tdlib')
makedepends=('git' 'rust' 'meson')
license=('GPL3')
source=('git+https://github.com/melix99/telegrand.git')
sha512sums=('SKIP')

pkgver() {
    cd "$srcdir/telegrand"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/telegrand"
    meson _build \
        -Dprefix=/usr \
        -Dtg_api_id=611335 \
        -Dtg_api_hash=d524b414d21f4d37f08684c1df41ac9c

    ninja -C _build
}

package() {
    cd "$srcdir/telegrand"
    DESTDIR="${pkgdir}" ninja -C _build install
}
