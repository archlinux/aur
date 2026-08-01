pkgname=simple-password
_reponame=spass
pkgver=0.1.2
pkgrel=1
pkgdesc="A password generator without any unnecessary stuff"
arch=('x86_64')
url="https://github.com/ESzPa/spass"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc')
makedepends=('cmake' 'xxd')
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b89c8492034e82b60350a55946b4a262c81006c772c44e9bbe78fcc12f9b342b')

build() {
  cmake -B build -S "$_reponame-$pkgver" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
