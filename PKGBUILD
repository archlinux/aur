# Maintainer: Emmanuel Gil Peyrot <emmanuel.peyrot@collabora.com>

pkgname=wayland-protocols-git
pkgver=0.1.0.30.f828a43
pkgrel=1
pkgdesc='Wayland protocols that add functionalities not available in the core protocol'
arch=('any')
url='http://cgit.freedesktop.org/wayland/wayland-protocols'
license=('MIT')
makedepends=('git')
conflicts=('wayland-protocols')
provides=('wayland-protocols')

source=('git://anongit.freedesktop.org/wayland/wayland-protocols')
sha1sums=('SKIP')

pkgver() {
    cd wayland-protocols

    for i in major_version minor_version micro_version; do
        local _$i=$(grep -m 1 $i configure.ac | sed 's/m4//' | grep -o "[[:digit:]]*")
    done

    echo "$_major_version.$_minor_version.$_micro_version.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
    mkdir -p wayland-protocols/build
}

build() {
    cd wayland-protocols/build
    ../autogen.sh --prefix=/usr
    make
}

package() {
    cd wayland-protocols/build
    make DESTDIR="${pkgdir}" install
}
