# Maintainer: Alad Wenter <alad@mailbox.org>
pkgname=howm-x11-git
pkgver=0.5.1.81.g3e3d6ee
pkgrel=1
pkgdesc='A lightweight, tiling X11 window manager that mimics vi by offering operators, motions and modes.'
url='https://github.com/HarveyHunt/howm'
license=('GPL')
arch=('i686' 'x86_64')
depends=('xcb-util-wm' 'sxhkd' 'cottage-git')
makedepends=('git')
provides=('howm-x11')
conflicts=('howm-x11')
source=("$pkgname::git+https://github.com/HarveyHunt/howm#branch=develop")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --tags | sed 's/-/./g'
}

prepare() {
    cd "$pkgname"
    git cherry-pick -n 16a910d7862b9771bcd12cef7cd6388d9e5d0c54
}

build() {
    cd "$pkgname"
    # https://github.com/HarveyHunt/howm/issues/68
    make release
}

package() {
    cd "$pkgname"
    make DESTDIR="$pkgdir"/ install

    mkdir -p "$pkgdir"/usr/share/howm/examples
    cp -a examples/* "$pkgdir"/usr/share/howm/examples/
}

# vim:set ts=2 sw=2 et:
