# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Peter Kosyh <p.kosyhgmail.com>

pkgname=instead
pkgver=3.2.2
pkgrel=1
pkgdesc="a quest interpreter"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/instead/"
license=('MIT')
depends=('sdl2_image' 'sdl2_mixer' 'sdl2_ttf' 'gtk2' 'lua' 'luajit')
makedepends=('cmake')
optdepends=('instead-launcher: install and update INSTEAD games from net','insteadman: Manager for INSTEAD interpreter.')
source=(http://downloads.sourceforge.net/project/instead/instead/${pkgver}/instead_${pkgver}.tar.gz)
sha256sums=('fd3e732e548a36ae85a27ea2e0743fd8c097ab8b613fc6e4b86a762fd15def1f')

build() {
  cd "${srcdir}"
  mkdir -p build
  cd build
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DWITH_LUAJIT=1 \
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


