# Maintainer: trojdev <troj at newo dot live>

pkgname=msga
pkgver=40
pkgrel=1
pkgdesc='Fast, lightweight native Slack client'
arch=('x86_64')
url='https://github.com/punarinta/make-slack-great-again'
license=('GPL-3.0-only')
depends=(
  'dbus'
  'freetype2'
  'gcc-libs'
  'glibc'
  'harfbuzz'
  'hicolor-icon-theme'
  'libxcb'
  'libxkbcommon'
  'libxkbcommon-x11'
  'systemd-libs'
  'wayland'
  'xcb-util'
  'xcb-util-cursor'
  'xcb-util-image'
  'xcb-util-renderutil'
)
makedepends=(
  'cmake'
  'ninja'
  'pkgconf'
)
conflicts=('msga-git' 'msga-bin')
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/punarinta/make-slack-great-again/archive/refs/tags/2026-10-10.tar.gz"
)
sha256sums=('SKIP')

build() {
  cd "$srcdir/make-slack-great-again-2026-10-10"

  cmake -S . -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=MinSizeRel \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DMSGA_SELF_UPDATE=OFF \
    -DMSGA_INSTALL_LAUNCHER=OFF \
    -DMSGA_SIZE_MAP=OFF \
    -DMSGA_BUILD_TESTS=OFF \
    -DMSGA_DEMO=OFF

  cmake --build build
}

package() {
  cd "$srcdir/make-slack-great-again-2026-10-10"

  install -Dm755 build/msga \
    "$pkgdir/usr/bin/msga"

  install -Dm644 gfx/msga.desktop \
    "$pkgdir/usr/share/applications/msga.desktop"

  install -Dm644 gfx/icon.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/msga.svg"

  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm644 THIRD_PARTY_LICENSES \
    "$pkgdir/usr/share/licenses/$pkgname/THIRD_PARTY_LICENSES"
}
