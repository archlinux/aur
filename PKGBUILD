# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=gir-to-d
pkgver=0.21.0
pkgrel=5
pkgdesc='Create D bindings from GObject introspection files'
arch=('x86_64')
url='https://github.com/gtkd-developers/gir-to-d'
license=('LGPL3')
depends=('gcc-libs' 'liblphobos')
makedepends=('meson' 'ldc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
         gir-to-d-glib-2.66.patch::"https://github.com/gtkd-developers/gir-to-d/commit/b5a463ce.patch")
sha512sums=('378a5c1cb1ec909fc39f1cc00b2479a0d826c3bdfe31b535e68719e4ccc74db548b670700dbf78eced417777477d1bcf5aad1cbe2bc15049f1ec52666c16a9da'
            'b3966192c0d04dac2154a721a0e637c751b113b50ea8f5ff4fd31a37c4d702509fded34aca7a934885e043df0218a232931cf4d28bd61549a39d421e57adaff6')

prepare() {
  patch -d $pkgname-$pkgver -p1 -i ../gir-to-d-glib-2.66.patch # Fix build with glib 2.66
}

build() {
  mkdir -p $pkgname-$pkgver/build
  cd $pkgname-$pkgver/build

  export DC=ldc

  arch-meson ..

  ninja
}

package() {
  cd $pkgname-$pkgver/build

  DESTDIR="$pkgdir" ninja install
}
