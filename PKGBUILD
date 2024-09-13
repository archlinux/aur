# Maintainer: xiota / aur.chaotic.cx
# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>

_pkgname="nm-tray"
pkgname="$_pkgname"
pkgver=0.5.1
pkgrel=1
pkgdesc='Simple Qt-based frontend for NetworkManager with icon in system tray'
url='https://github.com/palinek/nm-tray'
license=('GPL-2.0-or-later')
arch=('x86_64' 'aarch64')

depends=(
  'networkmanager-qt'
)
makedepends=(
  'cmake'
  'ninja'
  'qt6-tools'
)

_pkgsrc="$pkgname-$pkgver"
source=(
  "$pkgname-$pkgver.tar.gz"::"https://github.com/palinek/nm-tray/archive/$pkgver.tar.gz"
)
sha256sums=(
  '482ff25dff752ca5e43e9e475afab95fbb28da88e3c87bc4afa3d789a99d5aac'
)

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DNM_TRAY_XDG_AUTOSTART_DIR='/etc/xdg/autostart'
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$_pkgsrc/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
