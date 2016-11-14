# Maintainer: Christoph J. Thompson <thompsonc@protonmail.ch>

pkgname=nitrokey-app
pkgver=0.5.1
pkgrel=1
pkgdesc="Nitrokey management application"
arch=('i686' 'x86_64')
url="https://www.nitrokey.com"
license=('GPL3')
depends=('qt5-base' 'libusb>=1.0.0' 'hicolor-icon-theme')
makedepends=('cmake')
install=nitrokey-app.install
source=("https://github.com/Nitrokey/nitrokey-app/archive/v$pkgver.tar.gz")
sha1sums=('d099841bf01e4d6f47dadf2521a8fcb704be4344')

prepare() {
  cd $pkgname-$pkgver

  sed -i 's|DESTINATION\ etc/bash_completion.d|DESTINATION\ usr/share/bash-completion/completions|' \
    CMakeLists.txt
}

build() {
  cd $pkgname-$pkgver

  cmake . \
    -DCMAKE_INSTALL_PREFIX=/ \
    -DHAVE_LIBAPPINDICATOR=NO
  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir" install
}
