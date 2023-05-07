# Maintainer: Peter Mattern <pmattern at arcor dot de>

_pkgname=usbredir
pkgname=$_pkgname-git
pkgver=0.13.0.10.g39fca2b
pkgrel=1
pkgdesc='usbredir libraries and utilities'
arch=('x86_64')
url="https://www.spice-space.org/usbredir.html"
license=('GPL2' 'LGPL2.1')
depends=('libusb' 'glib2')
makedepends=('git' 'meson')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://gitlab.freedesktop.org/spice/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
    cd $_pkgname
    git describe --always | sed 's|^usbredir.||;s|-|.|g'
}

build() {
    mkdir build
    cd $_pkgname
    arch-meson ../build
    ninja -v -C ../build
}

package() {
    cd $_pkgname
    DESTDIR="${pkgdir}/" ninja -C ../build install
}
