# Maintainer: Konstantin Liberty <jon9097 at gmail dot com>

pkgname=obs-branch-output
pkgver=1.0.13
pkgrel=1
pkgdesc="OBS Studio plugin: Branch Output filter (per-source/scene streaming & recording)"
arch=('x86_64' 'aarch64')
url="https://github.com/OPENSPHERE-Inc/branch-output"
license=('GPL-2.0-only')
depends=('obs-studio')
makedepends=('cmake' 'ninja' 'git' 'gcc')
conflicts=('obs-branch-output-bin')

source=("$pkgname-$pkgver.tar.gz::https://github.com/OPENSPHERE-Inc/branch-output/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('1408275f9f30355efa7959d98453b6640017d38231de1c9e9d02e027a1999df1f298d710913480083b6a39c5f92a3d1b1c6d176e219ae17cb43ccad1509b0b46')

build() {
  cmake -S "branch-output-$pkgver" -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
