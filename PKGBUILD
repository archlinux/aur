# Maintainer: That One Seong <ThatOneSeong@protonmail.com>

_name=GUN4ALL-GUI
pkgname=gun4all-gui
pkgver=1.0
pkgrel=2
pkgdesc='Configuration utility for the IR-GUN4ALL DIY light-gun system.'
arch=('x86_64' 'aarch64')
url='https://github.com/SeongGino/GUN4ALL-GUI'
license=('GPL-3.0-only')
depends=('qt5-base' 'qt5-serialport' 'qt5-svg' 'icu')
makedepends=('cmake')
install=$pkgname.install
source=("https://github.com/SeongGino/GUN4ALL-GUI/archive/refs/tags/v${pkgver}-1.tar.gz"
        'GUN4ALL-GUI.desktop')
# TODO: -1 is a minor release
md5sums=('b04ee547698bd518ad30d1273a104a06'
         '5a34660fff6347e05463589e51b90bec')

build() {
  mkdir "$srcdir/$_name-$pkgver-1/build"
  cd "$srcdir/$_name-$pkgver-1/build"
  cmake ..
  make
}

package() {
  install -Dm755 "$srcdir/$_name-$pkgver-1/build/G4A-GUImain" "$pkgdir/usr/bin/G4A-GUI"
  desktop-file-install "$srcdir/GUN4ALL-GUI.desktop" --dir="$pkgdir/usr/share/applications"
}
