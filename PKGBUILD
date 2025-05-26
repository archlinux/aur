# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Federico Di Pierro <nierro92@gmail.com>
pkgname=libmodule
pkgver=5.0.1
pkgrel=3
pkgdesc="C linux library to build simple and modular projects"
arch=('x86_64' 'aarch64')
url="https://github.com/FedeDP/libmodule"
license=('MIT')
depends=('glibc')
makedepends=('cmake')
provides=('libmodule.so=5')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('35506360272cb13c0a09f17db6f716cf1c3e9fe40ac1bd574e4dc67916f7ca0a')

build() {
  cmake -B build -S "$pkgname-$pkgver" \
    -G "Unix Makefiles" \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_POLICY_VERSION_MINIMUM='3.5' \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  cd "$pkgname-$pkgver"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
