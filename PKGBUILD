# Maintainer: That One Seong <ThatOneSeong@protonmail.com>

_name=GUN4ALL-GUI
pkgname=gun4all-gui
pkgver=1.1
pkgrel=1
pkgdesc='Configuration utility for the IR-GUN4ALL DIY light-gun system.'
arch=('x86_64' 'aarch64')
url='https://github.com/SeongGino/GUN4ALL-GUI'
license=('GPL-3.0-only')
depends=('qt5-base' 'qt5-serialport' 'qt5-svg' 'icu')
makedepends=('cmake')
install=$pkgname.install
source=("https://github.com/SeongGino/GUN4ALL-GUI/archive/refs/tags/v${pkgver}.tar.gz"
        'GUN4ALL-GUI.desktop')
md5sums=('5acda34092e6aef95754854428500775'
         '5a34660fff6347e05463589e51b90bec')

build() {
  mkdir "$srcdir/$_name-$pkgver/build"
  cd "$srcdir/$_name-$pkgver/build"
  cmake ..
  make
}

package() {
  install -Dm755 "$srcdir/$_name-$pkgver/build/G4A-GUImain" "$pkgdir/usr/bin/G4A-GUI"
  desktop-file-install "$srcdir/GUN4ALL-GUI.desktop" --dir="$pkgdir/usr/share/applications"
}
