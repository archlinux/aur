# Maintainer: Antonio Rojas <arojas@archlinux.org>

_pkgname=plasma5-applets-window-buttons
pkgname=plasma5-applets-window-buttons-zhfix
pkgver=0.11.1
pkgrel=2
pkgdesc='Plasma 5 applet in order to show window buttons in your panels'
arch=(x86_64)
url='https://github.com/psifidotos/applet-window-buttons'
license=(GPL)
depends=(plasma-workspace)
makedepends=(extra-cmake-modules)
conflicts=(libappletdecoration "$_pkgname")
replaces=(libappletdecoration "$_pkgname")
provides=(libappletdecoration "$_pkgname")
source=(https://github.com/psifidotos/applet-window-buttons/archive/$pkgver/$_pkgname-$pkgver.tar.gz
        https://github.com/psifidotos/applet-window-buttons/commit/924994e1.patch
        https://github.com/detiam/applet-window-buttons/commit/47cf7cc.patch
        https://github.com/detiam/applet-window-buttons/commit/44b7d28.patch)
sha256sums=('0588a3bba77206766549139b4bee1a08b7be7a7113e658f746709b9ee4d3017a'
            'db8740b25036e5dd8b4b17375bea9871e49634b6fcde1b4cc3fb54e911ac789d'
            'e378aa8276a9a83ca199eadaa9413b8ae86781c8a4e098d0c2291794c5596599'
            '493d94c50188e1dbd267ac621a2fe12f4d2f8c681c2fd71f38e427a9d768d773')

prepare() {
  patch -d applet-window-buttons-$pkgver -p1 < 924994e1.patch # Support Plasma 5.27
  patch -d applet-window-buttons-$pkgver -p1 < 47cf7cc.patch # Add multilamguage
  patch -d applet-window-buttons-$pkgver -p1 < 44b7d28.patch # Add zh_CN local
}

build() {
  cmake -B build -S applet-window-buttons-$pkgver
  cmake --build build
  cd "./applet-window-buttons-$pkgver/translate/" && sh build || exit 1
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
