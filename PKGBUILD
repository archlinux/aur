# Maintainer: Torben <git at letorbi dot com>

pkgname=gnome-shell-extension-desktop-icons-ng-git
pkgver=47.0.2.r2.g64bc8c2
pkgrel=1
pkgdesc="A fork from the official desktop icons project, with several enhancements like Drag'n'Drop."
arch=('x86_64' 'i686' 'aarch64')
url="https://gitlab.com/rastersoft/desktop-icons-ng"
license=('GPL3')
depends=('gnome-shell>=3.38')
makedepends=('meson' 'glib2')
provides=('gnome-shell-extension-desktop-icons-ng')
conflicts=('gnome-shell-extension-desktop-icons-ng')
source=('git+https://gitlab.com/rastersoft/desktop-icons-ng.git')
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/desktop-icons-ng"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/desktop-icons-ng"
    meson --prefix=/usr --localedir=share/gnome-shell/extensions/ding@rastersoft.com/locale build
    ninja -v -C build
}

package() {
    cd "${srcdir}/desktop-icons-ng"
    DESTDIR="${pkgdir}" ninja -v -C build install
}
