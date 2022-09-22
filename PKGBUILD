# Maintainer: Your Name <youremail@domain.com>
pkgname=stduuid
pkgver=1.2.2
pkgrel=1
pkgdesc="A C++17 cross-platform single-header library implementation for universally unique identifiers"
arch=('any')
url="https://github.com/mariusbancila/stduuid"
license=('custom:MIT')
# depends=()
makedepends=(cmake)
# checkdepends=()
# optdepends=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DUUID_USING_CXX20_SPAN=ON \
        "$pkgname-$pkgver"
	make
}

check() {
	make -k test
}

package() {
	make DESTDIR="$pkgdir/" VERBOSE=1 install
  install -Dm755 -t "$pkgdir/usr/share/licenses/$pkgname" "$pkgname-$pkgver/LICENSE"
}
