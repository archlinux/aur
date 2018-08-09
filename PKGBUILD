# Maintainer: Alexis Rouillard <contact@arouillard.fr>

pkgname=waybar-git
pkgver=r32.03132bd2
pkgrel=1
pkgdesc='Highly customizable wayland bar for sway or wlroots based compositor.'
arch=('x86_64')
url='https://github.com/Alexays/Waybar/'
license=('MIT')
depends=('gtkmm3'
         'jsoncpp'
         'libinput'
         'libnl>=3.0'
         'libsigc++>=2.0'
         'wayland'
         'wlroots')
makedepends=('meson')
source=("${pkgname}::git://github.com/Alexays/Waybar"
        'meson.build.patch')
sha1sums=('SKIP'
          '36bd667affd6f5e3ca3e15665f7af2ea8438eda7')

prepare() {
    cd "${srcdir}/${pkgname}"
    patch meson.build "${srcdir}/meson.build.patch"
}

build() {
    cd "${srcdir}/${pkgname}"
    rm -rf "${srcdir}/build"
    meson --wrap-mode=nofallback --prefix=/usr "${srcdir}/build"
    ninja -C "${srcdir}/build"
}

package() {
    DESTDIR="$pkgdir" ninja -C "${srcdir}/build" install
}
