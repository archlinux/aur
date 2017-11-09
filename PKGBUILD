# $Id: PKGBUILD 188929 2016-09-07 12:50:30Z arojas $
# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=mustache-d
pkgver=0.1.3
pkgrel=5
pkgdesc="Moustache template engine for D"
arch=(x86_64)
url="https://github.com/repeatedly/mustache-d"
license=(custom:boost)
depends=()
makedepends=(meson dmd libphobos)
source=($pkgname-$pkgver::"https://github.com/repeatedly/mustache-d/archive/v$pkgver.tar.gz" "http://www.boost.org/LICENSE_1_0.txt")
sha256sums=('b8cf5fe193b11dece663ad2d7f8acbcc02ef48334f0fdc922a2dde3f8ac64b57'
            'c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566')

prepare() {
  mkdir -p build
}

build() {
  cd build
  meson ../$pkgname-$pkgver --prefix=/usr
  ninja
}

package() {
  cd build
  DESTDIR="$pkgdir" ninja install
  install -Dm644 "$srcdir"/LICENSE_1_0.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
