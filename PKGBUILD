# Maintainer: Adrien Gallouët <adrien@gallouet.fr>
pkgname=glorytun
pkgver=0.0.98_mud
pkgrel=1
pkgdesc="A small, simple and secure VPN"
arch=(x86_64)
url="https://github.com/angt/glorytun"
license=('BSD')
depends=('libsodium' 'iproute2')
makedepends=('meson' 'libsodium' 'pkgconfig')
_pkgnamever=$pkgname-${pkgver//_/-}
source=("$url/releases/download/v${pkgver//_/-}/$_pkgnamever.tar.gz")
md5sums=('6f032d212148fa81c13103f2b4042df6')

build() {
  cd "$srcdir/$_pkgnamever"
  meson build --prefix=/usr
  ninja -C build
}

package() {
  cd "$srcdir/$_pkgnamever"
  DESTDIR="$pkgdir/" ninja -C build install
}
