# Maintainer: Savvy Raghuvanshi <sraghuvanshi at college dot harvard dot edu>
# Author: Nick <https://github.com/nick92>

pkgname=lightdm-enso-os-greeter-git
pkgver=r195.bf0d53c
pkgrel=2
pkgdesc="A fork of Pantheon greeter."
arch=('x86_64')
url="https://github.com/nick92/Enso-OS"
license=('GPL')
depends=('clutter-gtk' 'libgee' 'libgl' 'lightdm' )
makedepends=('meson' 'git' 'vala')
conflicts=('lightdm-pantheon-greeter')
source=(git+https://github.com/nick92/Enso-OS)
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/Enso-OS"
     printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/Enso-OS/"
    arch-meson greeter build
    ninja -C build
}


package() {
    cd "$srcdir/Enso-OS"
    DESTDIR="$pkgdir" ninja -C build install
}
