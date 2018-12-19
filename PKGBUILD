# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

pkgname=glibd
_pkgname=GlibD
pkgver=2.0.0
pkgrel=5
pkgdesc='D bindings for the GLib C Utility Library'
arch=('x86_64')
url='https://github.com/gtkd-developers/GlibD'
license=('LGPL3')
depends=('glib2' 'liblphobos')
makedepends=('meson' 'ldc' 'gobject-introspection' 'gir-to-d')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('0935b9c4cb33289d0739923af3cd048300cc36e44ef72f2e8c1679944d6a4c4d')

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
