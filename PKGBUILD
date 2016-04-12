# Maintainer:  Peter Mattern <pmattern at arcor dot de>

_pkgname=virt-viewer
pkgname=$_pkgname-git
pkgver=2.0.234.ga19659e
pkgrel=1
pkgdesc='A lightweight interface for interacting with the graphical display of virtualized guest OS'
arch=("i686" "x86_64")
url='https://virt-manager.org'
license=('GPL')
depends=('gtk-vnc' 'libvirt-glib' 'spice-gtk3>=0.31' 'desktop-file-utils')
makedepends=('git' 'intltool' 'spice-protocol')
provides=("$_pkgname" "virtviewer")
conflicts=("$_pkgname" "virtviewer")
install=virt-viewer-git.install
source=("git+https://git.fedorahosted.org/git/$_pkgname.git")
sha256sums=("SKIP")

pkgver() {
    cd $_pkgname
    git describe --always | sed "s/^v//;s/-/./g"
}

build() {
    cd $_pkgname
    ./autogen.sh --prefix=/usr --disable-update-mimedb
    make
}

package() {
    cd $_pkgname
    make DESTDIR=$pkgdir install
}
