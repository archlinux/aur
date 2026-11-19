# Maintainer: chaoticdev
pkgname=magicpodscore
pkgver=2.0.12
pkgrel=2
pkgdesc="A command-line utility for managing AirPods, Beats, and Galaxy Buds."
arch=('x86_64')
url="https://github.com/steam3d/MagicPodsCore"
license=('GPL-3.0-only')
depends=(
  'libpulse'
  'bluez-libs'
  'glibc'
  'systemd-libs'
  'zlib'
  'openssl'

)
makedepends=(
  'cmake'
  'git'
  'ninja'
)
checkdepends=()
optdepends=()
provides=('magicpodscore')
conflicts=('magicpodscore-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/steam3d/MagicPodsCore/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('e070124a7acb8081d1d7b225f3c05c071061d5d7ce790d462d93a81c2fbe3c39')

build() {
  cd "$srcdir/MagicPodsCore-$pkgver"
  cmake -B build -S . -DCMAKE_BUILD_TYPE=Release -G Ninja
  cmake --build build
}

package() {
  cd "$srcdir/MagicPodsCore-$pkgver"

  install -Dm755 build/magicpodscore "$pkgdir/usr/bin/magicpodscore"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
