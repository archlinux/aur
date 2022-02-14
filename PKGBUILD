# Maintainer: Frederik Schwan <freswa at archlinux dot org>
# Contributor: Christian Rebischke <chris.rebischke@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Jonathan Wiersma <archaur at jonw dot org>

pkgname=virt-viewer
pkgver=11.0
pkgrel=1
pkgdesc='A lightweight interface for interacting with the graphical display of virtualized guest OS.'
arch=('x86_64')
url='https://gitlab.com/virt-viewer/virt-viewer'
license=('GPL')
depends=('gtk-vnc' 'libvirt' 'spice-gtk' 'libvirt-glib' 'libgovirt' 'vte3')
makedepends=('meson' 'intltool' 'spice-protocol' 'gobject-introspection' 'bash-completion')
replaces=('virtviewer')
source=("https://virt-manager.org/download/sources/virt-viewer/virt-viewer-${pkgver}.tar.xz"{,.asc})
b2sums=('41914a60361f0a47a0b0b54962d228ffaec67c6b69c664bb6fe683b7074dd5e2136d2bf3528b6e1b6b785cc4e337125fe16fdd94dd603dd42e8fde543931241a'
        'SKIP')
validpgpkeys=('DAF3A6FDB26B62912D0E8E3FBE86EBB415104FDF') # Daniel P. Berrange

build() {
  arch-meson virt-viewer-${pkgver} build \
    -Dlibvirt=enabled \
    -Dvnc=enabled \
    -Dspice=enabled \
    -Dovirt=enabled \
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
