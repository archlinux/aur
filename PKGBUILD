# Maintainer: twa022 <twa022 at gmail dot com>
# Maintainer: novik133

pkgname=novabar
_pkgname=NovaBar
pkgver=0.1.4
pkgrel=1
pkgdesc="A modern, modular macOS-style panel for Linux (X11/XFCE) built with Vala and GTK3"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/novik133/NovaBar"
license=('GPL3')
depends=('gtk3' 'glib2' 'libwnck3' 'networkmanager' 'appmenu-gtk-module' 'gtk-layer-shell')
makedepends=('vala' 'meson' 'ninja')
source=("$pkgname-$pkgver.tar.gz::https://github.com/novik133/NovaBar/archive/v$pkgver.tar.gz")
sha256sums=('4fe9441f55376e18f4ace9841b71508659157e8760e4f59ae932a8b94c39230e')

build() {
    cd "$srcdir/${_pkgname}-${pkgver}"
    arch-meson . build
    meson compile -C build
}

package() {
    cd "$srcdir/${_pkgname}-${pkgver}"
    meson install -C build --destdir "${pkgdir}"
    
    # Remove autostart file
    rm -fr "${pkgdir}"/etc/ #xdg/autostart/${pkgname}.desktop
}
