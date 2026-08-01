pkgname=simple-password
_reponame=spass
pkgver=0.1.1
pkgrel=2
pkgdesc="A password generator without any unnecessary stuff"
arch=('x86_64')
url="https://github.com/ESzPa/spass"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc')
makedepends=('cmake' 'xxd')
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f941b45609361d6b7b78a23f8f16a942af7bca8012d48ddd9a4b4d473817e68a')

build() {
  cmake -B build -S "$_reponame-$pkgver" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
