# Maintainer: Que Quotion <quequotion@bugmenot.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>

pkgname=wingpanel-indicator-namarupa-git
pkgver=r11.c168028
pkgrel=1
pkgdesc='Unofficial Ayatana compatibility layer for wingpanel'
arch=('i686' 'x86_64')
url='https://github.com/donadigo/wingpanel-indicator-namarupa'
license=('GPL3')
#depends=('gdk-pixbuf2' 'libgee' #guilty of these dependencies until proven otherwise, but not listed upstream
depends=('glib2' 'glibc' 'gtk3' 'granite'
         'libindicator-gtk3-ubuntu'
         'libwingpanel-2.0.so')
makedepends=('meson' 'git' 'gobject-introspection' 'vala')
conflicts=('wingpanel-indicator-ayatana')
source=('git+https://github.com/donadigo/wingpanel-indicator-namarupa.git')
sha256sums=('SKIP')

pkgver() {
    cd wingpanel-indicator-namarupa
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
    cd wingpanel-indicator-namarupa
    [ -d build ] && rm -rf build
    arch-meson build
    ninja -C build
}

package() {
    cd wingpanel-indicator-namarupa
    DESTDIR="${pkgdir}" ninja -C build install
}

# vim: ts=2 sw=2 et:
