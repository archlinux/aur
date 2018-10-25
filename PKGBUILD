# Maintainer: Alexis Rouillard <contact@arouillard.fr>

pkgname=waybar-git
pkgver=r128.28c65c64
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
         'libdbusmenu-glib'
         'libpulse'
         'wlroots')
makedepends=('meson'
             'git')

# source=("${pkgname}::git://github.com/Alexays/Waybar#commit=28c65c64"
source=("${pkgname}::git://github.com/Alexays/Waybar"
        'meson.build.patch')

sha1sums=('SKIP'
          '99b9da23d134953c04d6c3094f5ba7a435846a5e')

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
