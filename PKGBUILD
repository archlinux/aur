# Maintainer: Adrien Gallouët <adrien@gallouet.fr>
pkgname=glorytun
pkgver=0.1.0
pkgrel=1
pkgdesc="A small, simple and secure VPN"
arch=(x86_64)
url="https://github.com/angt/glorytun"
license=('BSD')
depends=('libsodium' 'iproute2')
makedepends=('meson' 'libsodium' 'pkgconfig')
_pkgnamever=$pkgname-${pkgver//_/-}
source=("$url/releases/download/v$pkgver/$_pkgnamever.tar.gz")
md5sums=('b944059b7aaa70024e377ba4a35a3c78')

build() {
  cd "$srcdir/$_pkgnamever"
  meson build --prefix=/usr
  ninja -C build
}

package() {
  cd "$srcdir/$_pkgnamever"
  DESTDIR="$pkgdir/" ninja -C build install
}
