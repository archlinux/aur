# Maintainer: Zan <zan@420blaze.it>

pkgname=kcm-tablet-git
_name=${pkgname%-git}
pkgver=r69.72eea10
pkgrel=1
pkgdesc='KDE Control Module to manage pen tablets managed by libinput on X or Wayland.'
arch=(x86_64)
url='https://gitlab.com/zanny/kcm-tablet'
license=(GPL3)
depends=(kdeclarative kirigami2)
optdepends=('qt5-x11extras: X11 support' 
            'xf86-input-libinput: X11 support')
makedepends=(extra-cmake-modules)
source=("git+https://gitlab.com/zanny/$_name.git")
sha256sums=('SKIP')

pkgver() {
    cd $_name
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S $_name
  cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
