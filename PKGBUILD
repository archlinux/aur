# Maintainer: Chris Lane <aur at chrislane dot com>

_pkgname=calf
pkgname="$_pkgname-no-gui"
pkgver=0.90.5
pkgrel=2
pkgdesc='LV2 plug-in suite and standalone Jack host - GUI disabled'
arch=('x86_64')
url='https://calf-studio-gear.org'
license=('LGPL-2.1-only')
provides=('calf')
conflicts=('calf')
depends=('expat' 'fluidsynth' 'jack')
makedepends=('cmake' 'lv2')
source=("https://github.com/calf-studio-gear/calf/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('af694c09b063c83ea475aa500ad9fc1fc44f7ca3a612952f0d74ca384c6ef993ff7b61c9d54122450966304d6f5f4e6a60e5a62a415ee09d75c66108063a5f70')

build() {
  local cmake_options=(
    -B build
    -S "$_pkgname-$pkgver"
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCMAKE_BUILD_TYPE=None
    -DWANT_EXPERIMENTAL=ON
    -DWANT_GUI=OFF
    -DWANT_LASH=OFF
  )
  cmake "${cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  cd "$_pkgname-$pkgver"

  install -Dm644 AUTHORS -t "$pkgdir/usr/share/doc/$_pkgname"
  install -Dm644 ChangeLog -t "$pkgdir/usr/share/doc/$_pkgname"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
}

# vim:set ts=2 sw=2 et:
