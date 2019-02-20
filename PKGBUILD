# Maintainer: Michael Yang <ohmyarchlinux@protonmail.com>

pkgname=dnspodc-git
pkgver=r18.28ae3c91
pkgrel=1
pkgdesc='IPv6 DNSPOD client written in C++17'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://github.com/microcai/dnspodc'
license=('GPL')
makedepends=('git' 'cmake>=3.0.0' 'boost')
depends=('boost-libs' 'openssl')
conflicts=('dnspodc')
provides=('dnspodc')
source=('git+https://github.com/microcai/dnspodc')
sha512sums=('SKIP')

pkgver() {
  cd dnspodc
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../dnspodc \
    -DBoost_USE_STATIC_LIBS=OFF \
    -DUSE_SYSTEM_OPENSSL=ON \
    -DUSE_SYSTEM_BOOST=ON \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  make -C build DESTDIR=${pkgdir} install
  install -Dm644 dnspodc/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
