# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Peter Kosyh <p.kosyhgmail.com>

pkgname=instead
pkgver=3.2.1
pkgrel=3
pkgdesc="a quest interpreter"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/instead/"
license=('MIT')
depends=('sdl2_image' 'sdl2_mixer' 'sdl2_ttf' 'lua51' 'gtk2')
makedepends=('cmake')
optdepends=('instead-launcher: install and update INSTEAD games from net','insteadman: Manager for INSTEAD interpreter.')
source=(http://downloads.sourceforge.net/project/instead/instead/${pkgver}/instead_${pkgver}.tar.gz)
sha256sums=('241556db250e0a156b98beaf9bb71b54fc9d186130910adbeab1c1961757dad2')

build() {
  cd "${srcdir}"
  mkdir -p build
  cd build
  export LUA_DIR=/usr/include/lua5.1
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    "${srcdir}"/$pkgname-$pkgver
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" PREFIX=/usr install

  cd "${srcdir}"/$pkgname-$pkgver
  cp -a doc/*.pdf doc/instead.txt doc/examples "$pkgdir"/usr/share/doc/instead/

  install -Dm0644 COPYING "$pkgdir"/usr/share/licenses/instead/COPYING
}


