# Maintainer: Lorenzo Zolfanelli <dev@zolfa.nl>
pkgname=obs-branch-output
pkgver=0.9.14
pkgrel=1
pkgdesc="This is an OBS Studio plugin that allows to live stream and/or recording for each source individually."
arch=('any')
url="https://github.com/OPENSPHERE-Inc/branch-output"
license=('GPL-2.0-only')
depends=('obs-studio>=30.1.0')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('853dfc13d2fee942ba130799c8a5bfe3e8787181eb2e58b1f7c89d2459f55883')

build() {
  cmake -DCMAKE_INSTALL_PREFIX=/usr -B build -S "branch-output-$pkgver"
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}


