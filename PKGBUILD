# Maintainer: Christoph J. Thompson <thompsonc@protonmail.ch>

pkgname=nitrokey-app
pkgver=0.6.1
pkgrel=1
pkgdesc="Nitrokey management application"
arch=('i686' 'x86_64')
url="https://www.nitrokey.com"
license=('GPL3')
depends=('qt5-base' 'libusb' 'hicolor-icon-theme')
makedepends=('cmake')
install=nitrokey-app.install
source=("https://github.com/Nitrokey/nitrokey-app/archive/v$pkgver.tar.gz")
sha256sums=('ee02871049c7ff318269f5d63ba2fd86535628c2937790534a6965f768a1706c')

prepare() {
  cd $pkgname-$pkgver

  sed -i 's|DESTINATION\ etc/bash_completion.d|DESTINATION\ usr/share/bash-completion/completions|' \
    CMakeLists.txt
}

build() {
  cd $pkgname-$pkgver

  cmake . \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DHAVE_LIBAPPINDICATOR=NO
  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir" install
}
