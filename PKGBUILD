# Maintainer: twa022 <twa022 at gmail dot com>
# Maintainer: novik133

pkgname=novadock
_pkgname=NovaDock
pkgver=0.2.0
pkgrel=1
pkgdesc="A macOS/GNOME-style dock and application launcher for XFCE4"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/novik133/NovaDock"
license=('GPL3')
depends=('gtk3' 'libwnck3' 'libkeybinder3' 'gtk-layer-shell')
makedepends=('vala' 'meson' 'ninja')
source=("$pkgname-$pkgver.tar.gz::https://github.com/novik133/NovaDock/archive/v$pkgver.tar.gz")
sha256sums=('e604d7a2da77ccbd7cd67d49abf8cc82bff6e995d3a5e74d2c20ed4826fb434a')

build() {
    cd "$srcdir/${_pkgname}-$pkgver"
    arch-meson . build
    meson compile -C build
}

package() {
    cd "$srcdir/${_pkgname}-$pkgver"
    meson install -C build --destdir "$pkgdir"

    # Remove autostart file
    rm -fr "${pkgdir}"/etc/ #xdg/autostart/${pkgname}.desktop
}
