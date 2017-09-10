# Maintainer: Alad Wenter <alad@mailbox.org>
pkgname=howm-x11-git
pkgver=0.5.1.74.gd810ad1
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

build() {
    cd "$pkgname"
    make debug
}

package() {
    cd "$pkgname"
    install -Dm755 bin/debug/howm "$pkgdir"/usr/bin/howm
    install -Dm644 howm.xsession.desktop "$pkgdir"/usr/share/xsessions/howm.xsession.desktop

    mkdir -p "$pkgdir"/usr/share/howm/examples
    cp -a examples/* "$pkgdir"/usr/share/howm/examples/
}

# vim:set ts=2 sw=2 et:
