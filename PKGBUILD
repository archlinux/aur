# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

_gitname=Flatseal
pkgname=flatseal-git
pkgver=v1.5.3.r1.g6b00d68
pkgrel=1
pkgdesc='A permissions manager for Flatpak.'
url="https://github.com/tchx84/Flatseal/"
arch=('x86_64')
license=('GPL3')
depends=('flatpak' 'gjs')
makedepends=('git' 'meson' 'flatpak-builder')
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
