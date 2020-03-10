# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=feedbackd-git
pkgver=0.0.0+git20200304.r0.gd80b97a
pkgrel=1
pkgdesc="A daemon to provide haptic, visual, and audio feedback on events"
url="https://source.puri.sm/Librem5/feedbackd"
license=("GPL3")
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
provides=('feedbackd')
conflicts=('feedbackd')
depends=('json-glib'
         'libgudev'
         'dconf'
         'gsound')
makedepends=('git'
             'gobject-introspection'
             'meson'
             'vala')
source=("git+https://source.puri.sm/Librem5/feedbackd.git")
sha256sums=('SKIP')


pkgver() {
    cd feedbackd
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    arch-meson feedbackd build
    ninja -C build
}

check() {
    ninja -C build test
}

package() {
    DESTDIR="${pkgdir}" ninja -C build install
}
