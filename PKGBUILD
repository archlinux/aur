# Maintainer: chiconcota <git@github.com:chiconcota>
pkgname=fcitx5-lilypad
pkgver=2.2.0
pkgrel=1
pkgdesc="Modern, hyper-fast Vietnamese Telex/VNI Input Method for Fcitx5 (Wayland/X11)"
arch=('x86_64' 'aarch64')
url="https://github.com/chiconcota/fcitx5-lilypad"
license=('GPL-3.0-or-later')
depends=('fcitx5' 'fmt' 'libinput' 'systemd-libs' 'python' 'python-qtpy' 'python-pyqt5')
makedepends=('cmake' 'extra-cmake-modules' 'go' 'gettext' 'libx11')
provides=('fcitx5-lilypad')
conflicts=('fcitx5-lilypad-git' 'fcitx5-lilypad-bin')
install=fcitx5-lilypad.install
source=("https://github.com/chiconcota/fcitx5-lilypad/archive/refs/tags/v${pkgver}.tar.gz"
        "fcitx5-lilypad.install")
sha256sums=('b8931562acbefc0fabd4c954ba5d211b78b9b98a704614f389873e6231e69f3f'
            '86c5c1b374ba83b5bee113b48f7cef110a499da35daa26801bcc4658eda2591b')

build() {
  cmake -B build -S "$srcdir/$pkgname-$pkgver/fcitx5-lilypad" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DCMAKE_BUILD_TYPE=Release
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
