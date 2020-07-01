# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=glibd
_pkgname=GlibD
pkgver=2.2.0
pkgrel=2
pkgdesc='D bindings for the GLib C Utility Library'
arch=('x86_64')
url='https://github.com/gtkd-developers/GlibD'
license=('LGPL3')
depends=('glib2' 'liblphobos')
makedepends=('meson' 'ldc' 'gobject-introspection' 'gir-to-d')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('c39af9a13fb3cb352e726f61e2a79e659ec18a0fefb7aaaefd9c6341cb8f4288c9072ed20e237d0723b2c2dbb08aec725c396e981ea5957532d5ba80704cfb28')

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
