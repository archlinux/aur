# Maintainer: Christian Rebischke <chris.rebischke@archlinux.org>
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Thore Bödecker <foxxx0@archlinux.org>

pkgname=cpp-hocon
pkgver=0.2.2
pkgrel=1
pkgdesc="C++ port of the Typesafe Config library"
arch=('x86_64')
url="https://github.com/puppetlabs/cpp-hocon"
license=('APACHE')
depends=('boost-libs' 'gcc-libs' 'glibc' 'leatherman' 'leatherman_util.so' 'leatherman_locale.so')
makedepends=('boost' 'cmake' 'leatherman' 'rapidjson')
provides=('libcpp-hocon.so')
source=("$pkgname-$pkgver.tar.gz::https://github.com/puppetlabs/cpp-hocon/archive/$pkgver.tar.gz")
sha512sums=('2a0c6aa4cabab18282bacc7cbbc4d9f237ab7073bfe12cb6fb1ea706761336bae0cf22a76c66d649a61b6bc6279c9db5ba8993bd0eb53fb88835c73570863948')

prepare() {
  cd "$pkgname-$pkgver"
  :
}

build() {
  cd "$pkgname-$pkgver"

  cmake \
    -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DENABLE_CXX_WERROR=OFF \
    -DCMAKE_INSTALL_PREFIX:PATH=/usr \
    -DBUILD_SHARED_LIBS=ON
  make -C build
}

check() {
  cd "$pkgname-$pkgver"/build
  make test
}

package() {
  cd "$pkgname-$pkgver"

  make -C build install DESTDIR="$pkgdir"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sw=2 et:
