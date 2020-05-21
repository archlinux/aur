# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=grcompiler
pkgver=5.2
pkgrel=1
pkgdesc='The SIL Graphite compiler'
arch=('x86_64' 'i686')
url="https://github.com/silnrsi/$pkgname"
license=('CPL' 'LGPL')
depends=('icu')
makedepends=('cmake' 'docbook-utils' 'perl-sgmls')
license=('CPL' 'LGPL')
source=("$pkgname-$pkgname.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('f3e2a0610fc309fc1ff03e5584420ec3e77ec1b4b7f9b108c7508e451a3498d7')

build() {
  cd "$pkgname-$pkgver"
  cmake -S . -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
  make -C build
}

package() {
    cd "$pkgname-$pkgver"
    make -C build DESTDIR="$pkgdir" install
    install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" license/*.txt
}

