# Maintainer: efindus <aur at efindus dot com>

pkgname=power-profiles-daemon-patched-amd-git
_pkgname=power-profiles-daemon
pkgver=0.21
pkgrel=1
pkgdesc="[redundant] Makes power profiles handling available over D-Bus (with AMD patches by Mario Limonciello)"
url='https://gitlab.freedesktop.org/upower/power-profiles-daemon'
license=(GPL-3.0-only)
arch=(x86_64)
depends=(gcc-libs
         glib2
         glibc
         libgudev
         polkit
         upower)
optdepends=('python-gobject: for powerprofilesctl')
makedepends=(meson)
checkdepends=(python-dbusmock
              python-isort
              python-mccabe
              umockdev)
source=(https://gitlab.freedesktop.org/upower/power-profiles-daemon/-/archive/$pkgver/$_pkgname-$pkgver.tar.gz)
sha256sums=('c15a368a59f2cae1474bdfccdd9357f06b0abc9eb7638a87f68c091aaf570349')

build() {
  meson $_pkgname-$pkgver build \
    --prefix /usr \
    --libexec lib \
    --sysconfdir /usr/share
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  echo -e "\033[1;31mWARNING: This package is now redundant, as these patches have been mainlined into the base version."
}
