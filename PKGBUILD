# Maintainer: smiley <me@smileyhq.pro>
pkgname=pinentry-hypr-git
pkgver=0.1.0.r4.ga8d98a1
pkgrel=1
pkgdesc="A Hyprland-native GnuPG pinentry using Qt6/QML/hyprutils"
arch=('x86_64')
url="https://github.com/AuthenticSm1les/pinentry-hypr"
license=('BSD-3-Clause')
depends=('qt6-base' 'qt6-declarative' 'hyprutils' 'hyprland-qt-support' 'libsecret')
makedepends=('git' 'cmake')
provides=('pinentry-hypr')
conflicts=('pinentry-hypr')
source=("git+https://github.com/AuthenticSm1les/pinentry-hypr.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "0.1.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S "${pkgname%-git}" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
