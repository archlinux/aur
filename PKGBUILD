# Maintainer:  FengZhongShaoNian <2844126834@qq.com>

_pkgname=virt-viewer
pkgname=${_pkgname}-no-headerbar-on-maximize
pkgver=11.0
pkgrel=1
pkgdesc='A lightweight interface for interacting with the graphical display of virtualized guest OS. This pkg contains a patch to hide the header bar when the window is maximized.'
arch=('x86_64')
url='https://gitlab.com/virt-viewer/virt-viewer'
license=('GPL')
depends=('gtk-vnc' 'libvirt' 'spice-gtk' 'libvirt-glib' 'libgovirt' 'vte3')
makedepends=('meson' 'intltool' 'spice-protocol' 'gobject-introspection' 'bash-completion')
replaces=('virtviewer')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/FengZhongShaoNian/virt-viewer.git#branch=borderless_when_maximized")
b2sums=('SKIP')

build() {
  arch-meson "${_pkgname}" build \
    -Dlibvirt=enabled \
    -Dvnc=enabled \
    -Dspice=enabled \
    -Dovirt=disabled \
    -Dvte=enabled \
    -Dbash_completion=enabled

  ninja -C build
}

check() {
  ninja -C build test
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}