# Maintainer: Savvy Raghuvanshi <sraghuvanshi at college dot harvard dot edu>
# Author: Nick <https://github.com/nick92>

pkgname=lightdm-enso-os-greeter-git
pkgver=r172.c949a8c
pkgrel=1
pkgdesc="A fork of Pantheon greeter."
arch=('any')
url="https://github.com/nick92/Enso-OS/greeter"
license=('GPL')
depends=('cairo' 'clutter' 'clutter-gtk' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'libgee' 'libgl' 'libx11' 'lightdm' 'vala')
makedepends=('meson' 'git')
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
