# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=glibd
_pkgname=GlibD
pkgver=2.1.0
pkgrel=6
pkgdesc='D bindings for the GLib C Utility Library'
arch=('x86_64')
url='https://github.com/gtkd-developers/GlibD'
license=('LGPL3')
depends=('glib2' 'liblphobos')
makedepends=('meson' 'ldc' 'gobject-introspection' 'gir-to-d')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('2e00933e666f213ef5e38d3df5695966a76cdac067603e39d09f7ac8a5a4cab48ea498044de1d9daa2920609b7f8d6d5c090a666a6507a563bb896be2cc8c32f')

build() {
  mkdir -p $_pkgname-$pkgver/build
  cd $_pkgname-$pkgver/build

  # Force build with LDC
  export DC=ldc

  arch-meson ..

  ninja
}

package() {
  cd $_pkgname-$pkgver/build

  DESTDIR="$pkgdir" ninja install
}
