# Maintainer: Konstantin Liberty <jon9097 at gmail dot com>

pkgname=obs-branch-output
pkgver=1.0.9
pkgrel=1
pkgdesc="OBS Studio plugin: Branch Output filter (per-source/scene streaming & recording)"
arch=('x86_64' 'aarch64')
url="https://github.com/OPENSPHERE-Inc/branch-output"
license=('GPL-2.0-only')
depends=('obs-studio')
makedepends=('cmake' 'ninja' 'git' 'gcc')
conflicts=('obs-branch-output-bin')

source=("$pkgname-$pkgver.tar.gz::https://github.com/OPENSPHERE-Inc/branch-output/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('7d34da9daf1167cbe4187e78fcc953a0c550a9c8440b1006616ccd544424194a6cb24d3aa917b46c38ed0804104a3751a2b166ce634e2e85b45856f849685613')

build() {
  cmake -S "branch-output-$pkgver" -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
