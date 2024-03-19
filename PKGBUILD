# Maintainer:  Hildigerr Vergaray <Maintainer@YmirSystems.com>
# Contributer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=pipewalker
pkgver=1.0
pkgrel=1
pkgdesc="Pieces of a computer network are to be turned, to make all computers connected to the same network"
arch=('i686' 'x86_64')
url="https://github.com/artemsen/pipewalker"
old_url="http://pipewalker.sourceforge.net/" #TODO: create pkg for any missing additional themes
license=('GPL')
depends=('mesa' 'sdl2' 'sdl2_image')
makedepends=('meson' 'ninja')
install=$pkgname.install
source=(https://github.com/artemsen/$pkgname/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('24232fdf71c7146f1621c461601b60bd6237d801e6403a5695be4d57419e1a21')

prepare() {
  cd "${srcdir}"/$pkgname-$pkgver

  meson setup --prefix=/usr --buildtype=release build
}

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  ninja -C build
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  DESTDIR="${pkgdir}" ninja -C build install
}
