# Maintainer: Sashanoraa <sasha@noraa.gay>
# Contributor: Gabriel Guldner <gabriel at guldner dot eu>

pkgname=git-credential-kwallet
pkgver=0.1.1
pkgrel=1
pkgdesc='Git credential helper for KWallet'
arch=('x86_64')
url='https://github.com/dasbaumwolltier/git-credential-kwallet'
license=('MIT')
depends=('kwallet')
provides=($pkgname)
conflicts=($pkgname)
makedepends=('cmake' 'make' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dasbaumwolltier/git-credential-kwallet/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7cf7aeff9d843c10bf20fa9c0edf8ec07d5a9bc76d71cec4007d4365bee81332')

prepare() {
  cd "$pkgname-$pkgver"
  mkdir -p build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
}

build() {
  cd "$pkgname-$pkgver/build"
  make
}

package() {
  cd "$pkgname-$pkgver/build"
  make DESTDIR="$pkgdir" install
}

