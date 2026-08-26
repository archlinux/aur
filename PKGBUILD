# Maintainer: chiconcota <git@github.com:chiconcota>
pkgname=fcitx5-lilypad
pkgver=2.3.0
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
sha256sums=('f8c8c5411f1c50fd1e63a689433799df13a345578dd4612b5540ee2f47f2e8e6'
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
