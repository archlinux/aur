# Maintainer: linkfrg
pkgname=ignis
pkgver=0.5
pkgrel=1
pkgdesc="A widget framework for building desktop shells, written and configurable in Python"
arch=('x86_64')
url="https://github.com/linkfrg/ignis"
license=('LGPL-2.1-or-later')
makedepends=('gobject-introspection' 'meson')
depends=('python' 'glib2' 'glib2-devel' 'glibc' 'gtk4' 'gtk4-layer-shell' 'libpulse' 'python-cairo' 'python-gobject' 'python-click' 'python-loguru')
optdepends=('gst-plugin-pipewire: required for recorder service'
            'gst-plugins-good: required for recorder service'
            'gst-plugins-ugly: required for recorder service'
            'networkmanager: required for network service'
            'dart-sass: SASS/SCSS compilation support'
            'upower: required for UPower Service'
            'gnome-bluetooth-3.0: required for Bluetooth Service')
            
source=("git+${url}#tag=v${pkgver}")
sha256sums=('SKIP')

prepare() {
  cd $srcdir/$pkgname
  meson subprojects download
}

build() {
  cd $srcdir/$pkgname
  arch-meson build --libdir "lib/$pkgname"
  meson compile -C build
}

package() {
  cd $srcdir/$pkgname
  meson install -C build --destdir "$pkgdir"
}
