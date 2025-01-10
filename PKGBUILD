# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs

pkgname=hyprland-qt-support
pkgver=0.1.0
pkgrel=1
pkgdesc='QML style provider for Hypr* QT apps'
arch=('x86_64')
url="https://github.com/hyprwm/$pkgname"
license=('BSD-3-Clause')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('cac1f980bd088b890097f3f999cfdf03e73ee94c53f3c92d0b3bc23baa9e7b2c')
makedepends=('cmake' 'gcc' 'pkgconf')
depends=('qt6-wayland>=6.6.0' 'hyprlang>=0.6.0' 'gcc-libs' 'qt6-declarative' 'qt6-base' 'glibc')

build() {
  cd "$pkgname-$pkgver"
  cmake \
    --no-warn-unused-cli \
    -DCMAKE_INSTALL_PREFIX:PATH=/usr \
    -DINSTALL_QML_PREFIX=/lib/qt6/qml \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -S \
    . \
    -B ./build
  cmake \
    --build ./build \
    --config Release \
    --target all
}

package() {
  cd "$pkgname-$pkgver"
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: ts=2 sw=2 et:
