# Maintainer: chiconcota <git@github.com:chiconcota>
pkgname=fcitx5-lilypad
pkgver=2.3.1
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
sha256sums=('2f8116ddc5db255be655221ffa108a0547601eb1f6c57dd6a4a5e2f2f9c92ac6'
            'a759df030c122306410f01750b82af66994d32e44a3e2d70352f0c65f411bf17')

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
