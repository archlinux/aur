# Maintainer: Konstantin Liberty <jon9097 at gmail dot com>

pkgname=obs-branch-output
pkgver=1.0.8
pkgrel=2
pkgdesc="OBS Studio plugin: Branch Output filter (per-source/scene streaming & recording)"
arch=('x86_64' 'aarch64')
url="https://github.com/OPENSPHERE-Inc/branch-output"
license=('GPL-2.0-only')
depends=('obs-studio')
makedepends=('cmake' 'ninja' 'git' 'gcc')
conflicts=('obs-branch-output-bin')

source=("$pkgname-$pkgver.tar.gz::https://github.com/OPENSPHERE-Inc/branch-output/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('a001455755a3b33fcec844b45ba6318a0c2b78f08ddcd0538c0cbbe66fc4e5c1bb931001152ef7db05024368ca6ae075d6bc045cc849773f3afe70e3bd299cec')

build() {
  cmake -S "branch-output-$pkgver" -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
