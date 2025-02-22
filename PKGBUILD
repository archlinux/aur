# Maintainer: linkfrg
pkgname=ignis-git
_pkgname=ignis
pkgver=0.4.r13.g88cacc4
pkgrel=3
pkgdesc="A widget framework for building desktop shells, written and configurable in Python"
arch=('x86_64')
url="https://github.com/linkfrg/ignis"
license=('GPL-3.0-only')
makedepends=('gobject-introspection' 'meson')
depends=('python' 'glib2' 'glib2-devel' 'glibc' 'gtk4' 'gtk4-layer-shell' 'libpulse' 'python-cairo' 'python-gobject' 'python-click' 'python-loguru')
optdepends=('gst-plugin-pipewire: required for Recorder Service'
            'gst-plugins-good: required for Recorder Service'
            'gst-plugins-ugly: required for Recorder Service'
            'networkmanager: required for Network Service'
            'dart-sass: SASS/SCSS compilation support'
            'upower: required for UPower Service'
            'gnome-bluetooth-3.0: required for Bluetooth Service')
            
provides=('ignis')
source=("git+${url}")
sha256sums=('SKIP')

pkgver(){
  cd $srcdir/$_pkgname
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $srcdir/$_pkgname
  meson subprojects download
}

build() {
  cd $srcdir/$_pkgname
  arch-meson build --libdir "lib/$_pkgname"
  meson compile -C build
}

package() {
  cd $srcdir/$_pkgname
  meson install -C build --destdir "$pkgdir"
}
