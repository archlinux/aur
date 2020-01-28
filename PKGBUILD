# Maintainer: Lukas Rose <public@lrose.de>
pkgname=geany-plugin-jsonprettifier
pkgver=1.6.0
pkgrel=2
pkgdesc="Clean up unformatted JSON in Geany editor"
arch=('i686' 'x86_64')
url="https://plugins.geany.org/jsonprettifier.html"
license=('GPL2')
depends=('geany' 'yajl')
makedepends=('cmake')
source=("https://github.com/zhgzhg/Geany-JSON-Prettifier/archive/v$pkgver.tar.gz" "Makefile.patch")
sha256sums=('3192d4d304cf1ce0bac78997a0ede9a88724e1f0fadbcf9a1968e9cff496740e'
            '391e5b83f87b23ac2a01c8f3252f028f391361500b70ee4b29710267cc54fa49')

prepare() {
  cd "Geany-JSON-Prettifier-$pkgver"
  patch --forward --strip=1 --input="${srcdir}/Makefile.patch"
}

build() {
  cd "Geany-JSON-Prettifier-$pkgver"
  make -j1
}

package() {
  cd "Geany-JSON-Prettifier-$pkgver"
  mkdir -p "$pkgdir/usr/lib/geany"
  make -j1 DESTDIR="$pkgdir/" install
}
