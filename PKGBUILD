# Maintainer: Dylan Delgado <dylan1496 at live dot com>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: Dmitry N. Shilov <stormblast@land.ru>

pkgname=sakura
pkgver=3.8.7
pkgrel=1
pkgdesc="A terminal emulator based on GTK and VTE"
arch=('x86_64')
url="https://launchpad.net/sakura"
license=('GPL')
depends=('vte3' 'libxft')
makedepends=('cmake')
source=("https://launchpad.net/sakura/trunk/${pkgver}/+download/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('ba7009ff03cacc19149d82f280413defb019540d2409e6cb9243f0d7ac812922')

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
