# Maintainer:  Peter Mattern <pmattern at arcor dot de>

_pkgname=virt-viewer
pkgname="${_pkgname}"-git
pkgver=11.0.r103.ga634fa8
pkgrel=1
pkgdesc='A lightweight interface for interacting with the graphical display of virtualized guest OS'
arch=('i686' 'x86_64' 'aarch64')
url='https://virt-manager.org'
license=('GPL-2.0-only')
depends=('libvirt-glib' 'spice-gtk-git' 'gtk-vnc' 'libgovirt' 'vte3')
makedepends=('git' 'meson' 'glib2-devel' 'bash-completion')
provides=("${_pkgname}" 'virtviewer')
conflicts=("${_pkgname}" 'virtviewer')
source=("git+https://gitlab.com/${_pkgname}/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
    cd ${_pkgname}
    git describe --always | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
    rm -Rf build && mkdir build
    cd ${_pkgname}
    arch-meson ../build
    ninja -v -C ../build
}

package() {
    cd ${_pkgname}
    DESTDIR="${pkgdir}"/ ninja -C ../build install
}
