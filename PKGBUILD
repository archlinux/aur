# Maintainer: linkfrg
pkgname=ignis
pkgver=0.4
pkgrel=1
pkgdesc="A modern widget system"
arch=('x86_64')
url="https://github.com/linkfrg/ignis"
license=('GPL-3.0-only')
makedepends=('gobject-introspection' 'meson')
depends=('python' 'glib2' 'glib2-devel' 'glibc' 'gtk4' 'gtk4-layer-shell' 'libpulse' 'python-cairo' 'python-gobject' 'python-click' 'python-requests' 'python-loguru')
optdepends=('gst-plugin-pipewire: required for recorder service'
            'gst-plugins-good: required for recorder service'
            'gst-plugins-ugly: required for recorder service'
            'networkmanager: required for network service'
            'dart-sass: SASS/SCSS compilation support'
            'upower: required for UPower Service'
            'gnome-bluetooth-3.0: required for Bluetooth Service')
            
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v${pkgver}/ignis-v${pkgver}.tar.gz")
sha256sums=('aba02e6d970217137056134ba7cdb2fee88b1b14b8ae0939946ba1e9803709cb')

build() {
  cd $srcdir/$pkgname
  arch-meson build --libdir "lib/$pkgname"
  meson compile -C build
}

package() {
  cd $srcdir/$pkgname
  meson install -C build --destdir "$pkgdir"
}
