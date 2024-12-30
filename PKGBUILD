# Maintainer: linkfrg
pkgname=ignis
pkgver=0.4
pkgrel=1
pkgdesc="Full-featured Python framework for building desktop shells using GTK4."
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
sha256sums=('dc8a8d76b80bea19497f6029b8ab816e5eceb2f2ff9697675bd1ac87ada70513')

build() {
  cd $srcdir/$pkgname
  arch-meson build --libdir "lib/$pkgname"
  meson compile -C build
}

package() {
  cd $srcdir/$pkgname
  meson install -C build --destdir "$pkgdir"
}
