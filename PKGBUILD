# Maintainer: Stefan Tatschner <stefan@rumpelsepp.org>

pkgname=wdisplays
pkgver=1.0
pkgrel=2
pkgdesc='GUI display configurator for wlroots compositors'
url='https://github.com/cyclopsian/wdisplays'
license=('GPL')
provides=('wdisplays')
arch=('x86_64')
depends=('gtk3' 'libepoxy' 'wayland' 'wayland-protocols')
makedepends=('meson')
source=("$pkgname-$pkgver::https://github.com/cyclopsian/wdisplays/archive/${pkgver}.tar.gz"
        "20.patch")
sha256sums=('fa34d5bdfd87d833e18a89b2acacc27833d7297374719773a705f2d3e89cdddf'
            'e7cc9418945f12632fd17b408fdd8f1c0287f31e4bc3d2afab7683a84e8f2fd2')

prepare() {
  cd "$pkgname-$pkgver"
  patch --forward --strip=1 --input="${srcdir}/20.patch"
}

build() {
  cd "$pkgname-$pkgver"
  arch-meson "$srcdir/build"
  ninja -C "$srcdir/build"
}

package() {
  cd "$pkgname-$pkgver"
  DESTDIR="$pkgdir" ninja -C "$srcdir/build" install
}

