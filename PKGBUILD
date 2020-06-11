# Maintainer: Zan <zan@cock.li>

pkgname=kcm-tablet-git
pkgver=r65.0cc9e4e
pkgrel=1
pkgdesc='KDE Control Module to manage pen tablets managed by libinput on X or Wayland.'
arch=('x86_64')
url='https://gitlab.com/zanny/kcm-tablet'
license=('GPL3')
depends=('kdeclarative' 'kirigami2')
optdepends=('qt5-x11extras: X11 support' 'xorg-xinput: X11 support')
makedepends=('cmake-git' 'extra-cmake-modules')
source=("git+https://gitlab.com/zanny/kcm-tablet.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake "../${pkgname%-git}"
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
