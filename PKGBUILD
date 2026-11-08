# Maintainer: toshk0 <toshakosoga@gmail.com>
pkgname=magicpods
pkgver=1.0.5
pkgrel=1
pkgdesc="Control center for your Bluetooth headphones (AirPods, Beats, Galaxy Buds)"
arch=('x86_64' 'aarch64')
url="https://github.com/steam3d/MagicPodsLinux"
license=('GPL-3.0-only')
depends=(
  'qt6-base'
  'qt6-declarative'
  'qt6-websockets'
  'qt6-svg'
  'hicolor-icon-theme'
  'magicpodscore'
)
makedepends=(
  'cmake'
  'ninja'
  'qt6-tools'
)
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/steam3d/MagicPodsLinux/archive/refs/tags/$pkgver.tar.gz"
  "app.magicpods.desktop"
)
sha256sums=('639e7e73d7566bd8b15db6f5a3ef7858aff39d91a36f4f7bd8a167b5d75533bd'
            '888797cc6355cbff5f24deb82b36e82274c793bd514bbe766eab372973d46772')

build() {
  cd "MagicPodsLinux-$pkgver"
  cmake -S . -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_SKIP_RPATH=ON \
    -Wno-dev
  cmake --build build
}

package() {
  cd "MagicPodsLinux-$pkgver"

  install -Dm755 "build/magicpods" "$pkgdir/usr/bin/magicpods"

  install -Dm644 "src/app/qml/assets/icons/mp-logo-color.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/magicpods.svg"

  install -Dm644 "$srcdir/app.magicpods.desktop" \
    "$pkgdir/usr/share/applications/app.magicpods.desktop"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
