# Maintainer: Étienne Deparis <etienne@depar.is>
# Maintainer: Christoph J. Thompson <thompsonc@protonmail.ch>

pkgname=nitrokey-app
pkgver=0.6.3
pkgrel=1
pkgdesc="Nitrokey management application"
arch=('i686' 'x86_64')
url="https://www.nitrokey.com"
license=('GPL3')
depends=('qt5-base' 'libusb' 'hicolor-icon-theme')
makedepends=('cmake')
install=nitrokey-app.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/Nitrokey/nitrokey-app/archive/v$pkgver.tar.gz")
sha256sums=('6ab756ca34e0deedfe5e99eeb5763a68adc9bafad78ee94b3b9aad2d28fed8c8')

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
