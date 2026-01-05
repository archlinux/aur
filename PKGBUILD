# Maintainer: Franco Brigiotti <fbrigio@gmail.com>

pkgname=cash-register
pkgver=0.3
pkgrel=1
pkgdesc="Cash register application with Qt6 interface"
arch=('x86_64')
url="https://github.com/Brigio/cash-register"
license=('GPL3')

depends=(
  'qt6-base'
  'hicolor-icon-theme'
)

makedepends=(
  'cmake'
  'ninja'
  'qt6-tools'
)

source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/Brigio/cash-register/archive/v$pkgver.tar.gz"
)

sha256sums=('578b65b1ac8e78b45fc2ddac97ceccd3fc22e13e2704ce562ccb06b5d35487e5')

build() {
  cd "$pkgname-$pkgver"

  cmake -S . -B build \
    -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package() {
  cd "$pkgname-$pkgver"

  DESTDIR="$pkgdir" cmake --install build

  # Desktop file
  install -Dm644 cash-register.desktop \
    "$pkgdir/usr/share/applications/cash-register.desktop"

  # Icons (hicolor)
  for size in 16x16 32x32 48x48 64x64 128x128 256x256; do
  install -Dm644 \
    icons/hicolor/$size/apps/cash-register.png \
    "$pkgdir/usr/share/icons/hicolor/$size/apps/cash-register.png"
done

  # AppStream metadata
  install -Dm644 cash-register.metainfo.xml \
    "$pkgdir/usr/share/metainfo/cash-register.metainfo.xml"
}
