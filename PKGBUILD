# Maintainer: chaoticdev
pkgname=magicpodscore
pkgver=2.0.7
pkgrel=1
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
)
checkdepends=()
optdepends=()
provides=('magicpodscore')
conflicts=('magicpodscore-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/steam3d/MagicPodsCore/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('0d34f6f3d5c004f39b7860c8f79b2fe6c83faadc8cf8b306118e5d0f333e91da')

build() {
  cd "$srcdir/MagicPodsCore-$pkgver"
  cmake -B build -S . -DCMAKE_BUILD_TYPE=Release
  cmake --build build
}

package() {
  cd "$srcdir/MagicPodsCore-$pkgver"

  install -Dm755 build/magicpodscore "$pkgdir/usr/bin/magicpodscore"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
