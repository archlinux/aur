# Maintainer: Fijxu <fijxu (at) zzls (dot) xyz>

_gitname=Flatseal
pkgname=flatseal-git
pkgver=v1.8.1.r115.g2ba3c83
pkgrel=1
pkgdesc='A permissions manager for Flatpak.'
url="https://github.com/tchx84/Flatseal/"
arch=('x86_64')
license=('GPL3')
depends=('gjs' 'webkitgtk-6.0' 'appstream-glib')
makedepends=('git' 'meson')
source=("git+https://github.com/tchx84/Flatseal.git")
sha1sums=('SKIP')

pkgver() {
    cd $srcdir/$_gitname
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


build() {
    cd $srcdir/$_gitname
    meson --prefix /usr --buildtype=plain . build
}

package() {
    cd $srcdir/$_gitname
    DESTDIR="$pkgdir" meson install -C build
}
