# Maintainer: SonOfMithras <ammar.alriyamy@gmail.com>
pkgname=plasma-theme-master
pkgver=2.1.0
pkgrel=2
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
sha256sums=('cf99fcfb6a9f0fd0a986cd836f320c67329122bfe0d4ef1067f8babef06e21ac')
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
