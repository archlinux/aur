# Maintainer:  Peter Mattern <pmattern at arcor dot de>

_pkgname=virt-viewer
pkgname=$_pkgname-git
pkgver=9.0.7.gc6afc28
pkgrel=2
pkgdesc='A lightweight interface for interacting with the graphical display of virtualized guest OS'
arch=('i686' 'x86_64')
url='https://virt-manager.org'
license=('GPL')
depends=('gtk-vnc' 'libvirt-glib' 'spice-gtk' 'gobject-introspection')
makedepends=('git' 'meson' 'intltool' 'spice-protocol-git')
provides=("$_pkgname" 'virtviewer')
conflicts=("$_pkgname" 'virtviewer')
source=("git+https://gitlab.com/$_pkgname/$_pkgname.git")
sha256sums=("SKIP")

pkgver() {
    cd $_pkgname
    git describe --always | sed "s/^v//;s/-/./g"
}

build() {
    mkdir build
    cd $_pkgname
    arch-meson ../build
    ninja -v -C ../build
}

package() {
    cd $_pkgname
    DESTDIR="$pkgdir/" ninja -C ../build install
}
