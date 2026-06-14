# Maintainer: SonOfMithras <ammar.alriyamy@gmail.com>
pkgname=plasma-theme-master
pkgver=2.0.7
pkgrel=1
pkgdesc="Daemon and GUI to generate/synchronize and control theme dynamically across KDE Plasma and universal applications"
arch=('x86_64')
url="https://github.com/SonOfMithras/plasma-theme-master"
license=('MIT')
depends=('qt6-base' 'kconfig' 'kcoreaddons' 'kcolorscheme')
makedepends=('cmake' 'extra-cmake-modules')
optdepends=('python-pipx: for Material You color generation support'
            'kvantum: for Kvantum theme support'
            'klassy: for window decoration preset switching support')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9c6382ac13fe0e8a538d901cbb22d795ca5ed1c3a42d448903be7fe7c5494b6c')
install="$pkgname.install"

build() {
  cmake -B build -S "$pkgname-$pkgver" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  
  # Install systemd user service
  install -Dm644 "$pkgname-$pkgver/$pkgname.service" -t "$pkgdir/usr/lib/systemd/user/"
}
