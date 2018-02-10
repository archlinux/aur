# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Peter Kosyh <p.kosyhgmail.com>

pkgname=instead
pkgver=3.2.0
pkgrel=1
pkgdesc="a quest interpreter"
arch=('x86_64')
url="http://sourceforge.net/projects/instead/"
license=('MIT')
depends=('sdl2_image' 'sdl2_mixer' 'sdl2_ttf' 'lua' 'gtk2')
makedepends=('cmake')
optdepends=('instead-launcher: install and update INSTEAD games from net')
source=(http://downloads.sourceforge.net/project/instead/instead/${pkgver}/instead_${pkgver}.tar.gz)
sha256sums=('ca6cf93b02039df2c6fe36e429566cf52b6a957724f748a45b36edfe6cc3a750')

build() {
  cd "${srcdir}"
  mkdir -p build
  cd build
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
  cp -a doc/*.{html,pdf} doc/instead.txt doc/examples "$pkgdir"/usr/share/doc/instead/

  install -Dm0644 COPYING "$pkgdir"/usr/share/licenses/instead/COPYING
}

