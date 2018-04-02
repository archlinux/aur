# Maintainer: Stephen Brandt <stephen@stephenbrandt.com>

pkgname=haguichi-git
pkgver=r320.0a59e37
pkgrel=1
pkgdesc="Provides a user friendly GUI to control the Hamachi client on Linux (development version)"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
url="https://github.com/ztefn/haguichi"
license=('GPL3')
depends=('gtk3' 'libappindicator-gtk3' 'libnotify' 'logmein-hamachi')
makedepends=('git' 'meson' 'vala')
conflicts=('haguichi')
provides=('haguichi')
replaces=('haguichi-bzr' 'haguichi-indicator-bzr')
source=("git+$url")
sha512sums=('SKIP')
_pkg=haguichi

pkgver() {
  cd $_pkg
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $_pkg
  rm -rf build
  mkdir build && cd build

  meson -Denable-appindicator=true ..
  ninja
}

package() {
  DESTDIR="$pkgdir" ninja -C $_pkg/build install
}
