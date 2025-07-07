# Maintainer: Chris Lane <aur at chrislane dot com>

_pkgname=calf
pkgname="$_pkgname-no-gui"
pkgver=0.90.8
pkgrel=1
pkgdesc='LV2 plug-in suite and standalone Jack host - GUI disabled'
arch=('x86_64')
url='https://calf-studio-gear.org'
_url="https://github.com/calf-studio-gear/calf"
license=(
  GPL-2.0-or-later
  LGPL-2.0-or-later
)
provides=('calf')
conflicts=('calf')
depends=('expat' 'fluidsynth' 'jack')
makedepends=('cmake' 'lv2')
source=("$_url/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('a90e4780ee9006b450525d90142f325e7d93594c875984bd2590964e9a45a68daeaa35bcc68c7c0806ba39fc28ef79250744c3406647906447ce43b238cbd432')

build() {
  local cmake_options=(
    -B build
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX=/usr
    -DWANT_EXPERIMENTAL=ON
    -DWANT_GUI=OFF
    -DWANT_LASH=OFF
    -S "$_pkgname-$pkgver"
    -W no-dev
  )

  cmake "${cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 $_pkgname-$pkgver/{AUTHORS,ChangeLog,README.md} -t "$pkgdir/usr/share/doc/$pkgname"
}

# vim:set ts=2 sw=2 et:
