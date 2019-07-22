# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

pkgname=d-hidapi
_pkgname=hidapi-d
pkgver=1.0.3
pkgrel=1
pkgdesc='D bindings for HIDAPI'
arch=('x86_64')
url='https://github.com/FFY00/hidapi-d'
license=('MIT')
depends=('liblphobos' 'hidapi')
makedepends=('meson' 'ldc')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('cc541f0d7a5745509cda41a8a59c60fd63cb08c1904d6e1d48f9d2f1e9a54dbdf571fca913a99faf15575847f0e5d4a74da0f9eb16d8f8e79f37f867f8b8145e')

build() {
  mkdir -p $_pkgname-$pkgver/build
  cd $_pkgname-$pkgver/build

  export DC=ldc

  arch-meson .. -Db_pie=false -Db_lto=false

  ninja
}

package() {
  cd $_pkgname-$pkgver/build

  DESTDIR="$pkgdir" ninja install

  install -Dm 644 ../LICENSE "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE
}

