# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=glibd
_pkgname=GlibD
pkgver=2.0.2
pkgrel=3
pkgdesc='D bindings for the GLib C Utility Library'
arch=('x86_64')
url='https://github.com/gtkd-developers/GlibD'
license=('LGPL3')
depends=('glib2' 'liblphobos')
makedepends=('meson' 'ldc' 'gobject-introspection' 'gir-to-d')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "$url/commit/7c29b086f78ece953655a3e0f405119daf78196e.patch")
sha512sums=('b87716a5448d8b956f9a580c0fd32ab768f1127cc81bb74c8423381018a83e9dd21f20b1c5b1ebed15436c6cc924daea5d239aec390b73ccd19cf17f41f75f8b'
            '8c35273f98ad4141c3263a606307b69a5a2675e0eebb7da27f997310c8209f2b264368efebf710a09c9d5ced36888a29489e71cc222bf2cb43ce6b916c7c9dba')

prepare(){
  cd $_pkgname-$pkgver

  # Fix missing gmodules dep
  patch -p1 < ../7c29b086f78ece953655a3e0f405119daf78196e.patch
}

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
