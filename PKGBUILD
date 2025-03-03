# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
pkgname=autodock-vina
pkgver=1.2.7
pkgrel=1
arch=('x86_64')
license=('Apache-2.0')
pkgdesc="A tool for drug discovery, molecular docking and virtual screening"
url="https://github.com/ccsb-scripps/AutoDock-Vina"
depends=('boost-libs')
makedepends=('boost')
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('038a2ade139eeb85b4bc7f5242fbc770f192427735e17bdc877b7420f39553d9')

build() {
  cd "$srcdir"/AutoDock-Vina-$pkgver/build/linux/release
  sed -i 's/-std=c++11/-std=c++14/' Makefile
  make
}

package() {
  cd "$srcdir"/AutoDock-Vina-$pkgver/build/linux/release
  install -Dm755 vina "$pkgdir"/usr/bin/vina
  install -Dm755 vina_split "$pkgdir"/usr/bin/vina_split
}
