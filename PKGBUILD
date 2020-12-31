# Maintainer: Christopher Snowhill <kode54@gmail.com>
# Contributor: katt <magunasu.b97@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=gst-plugin-pipewire-git
_pkgbase=pipewire
pkgver=0.3.18.91.gc39ba857
_ver=${pkgver:0:3}
pkgrel=1
pkgdesc='Multimedia graph framework - pipewire plugin (git)'
depends=(pipewire libpipewire-$_ver.so gst-plugins-base-libs)
provides=(gst-plugin-pipewire)
conflicts=(gst-plugin-pipewire)
url=https://pipewire.org
license=(LGPL2.1)
arch=(x86_64)
makedepends=(git meson ninja valgrind gst-plugins-base jack2)
source=(git+https://gitlab.freedesktop.org/pipewire/pipewire.git)
md5sums=('SKIP')

pkgver() {
    git -C ${_pkgbase} describe --long --tags | tr - .
}

build() {
    arch-meson ${_pkgbase} build \
        -D docs=false \
        -D bluez5=false \
        -D udevrulesdir=/usr/lib/udev/rules.d
    ninja -C build src/gst/libgstpipewire.so
}


package() {
    install -Dm755 build/src/gst/libgstpipewire.so "$pkgdir"/usr/lib/gstreamer-1.0/libgstpipewire.so
}
