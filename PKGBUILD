# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Federico Di Pierro <nierro92@gmail.com>
pkgname=libmodule
pkgver=5.0.2
pkgrel=1
pkgdesc="C linux library to build simple and modular projects"
arch=('x86_64' 'aarch64')
url="https://github.com/FedeDP/libmodule"
license=('MIT')
depends=('glibc')
makedepends=('cmake')
provides=('libmodule.so=5')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('72101e69aabe16937576fa30a61830309b28ce96aa3bb7de5958134fa521f7fe')

build() {
  cmake -B build -S "$pkgname-$pkgver" \
    -G "Unix Makefiles" \
    -DCMAKE_BUILD_TYPE='RelWithDebInfo' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  cd "$pkgname-$pkgver"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
