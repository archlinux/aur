# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Thore Bödecker <foxxx0@archlinux.org>
# Contributor: Christian Rebischke <chris.rebischke@archlinux.org>
# Contributor: Tim Meusel <tim@bastelfreak.de>

pkgname=cpp-hocon
pkgver=0.3.0
pkgrel=14
pkgdesc="C++ port of the Typesafe Config library"
arch=('x86_64')
url="https://github.com/puppetlabs/cpp-hocon"
license=('APACHE')
depends=('boost-libs' 'gcc-libs' 'glibc' 'leatherman' 'leatherman_util.so' 'leatherman_locale.so')
makedepends=('boost' 'cmake' 'leatherman' 'rapidjson')
checkdepends=('python')
provides=('libcpp-hocon.so')
source=("$pkgname-$pkgver.tar.gz::https://github.com/puppetlabs/cpp-hocon/archive/$pkgver.tar.gz")
sha512sums=('de997e6d90330f901863b7da0d6f6e069a31e052b6f31c1e3009a9559c863f08879ecf4e202c763ec32567dd3a1e436ff5d3bf0b3009a085ef3ee95e5ca6c7e5')

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
