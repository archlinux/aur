# Maintainer: Christoph J. Thompson <thompsonc@protonmail.ch>

pkgname=nitrokey-app
pkgver=0.6.2
pkgrel=1
pkgdesc="Nitrokey management application"
arch=('i686' 'x86_64')
url="https://www.nitrokey.com"
license=('GPL3')
depends=('qt5-base' 'libusb' 'hicolor-icon-theme')
makedepends=('cmake')
install=nitrokey-app.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/Nitrokey/nitrokey-app/archive/v$pkgver.tar.gz")
sha256sums=('dd66272baf2b6818b9bb40391ec4901a36d2df2dbfb8c925b6502a57bd57bf01')

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
