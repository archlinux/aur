# Maintainer: Dylan Delgado <dylan1496 at live dot com>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: Dmitry N. Shilov <stormblast@land.ru>

pkgname=sakura
pkgver=3.8.6
pkgrel=1
pkgdesc="A terminal emulator based on GTK and VTE"
arch=('x86_64')
url="https://launchpad.net/sakura"
license=('GPL')
depends=('vte3' 'libxft')
makedepends=('cmake')
source=("https://launchpad.net/sakura/trunk/${pkgver}/+download/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('b07501185cc0e9c8ca4fd5e59f4c9db55417e97d24ba2c3031bedd80741b3be3')

prepare() {
  cd "$srcdir/${pkgname}-${pkgver}"

  # Set default font size a bit smaller
  sed -i 's|#define DEFAULT_FONT "Bitstream Vera Sans Mono 14"|#define DEFAULT_FONT "Bitstream Vera Sans Mono 10"|g' src/sakura.c
}

build() {
  cd "$srcdir/${pkgname}-${pkgver}"

  cmake -DCMAKE_INSTALL_PREFIX=/usr . 
  make 
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install 
}
