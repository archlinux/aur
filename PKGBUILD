# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Peter Kosyh <p.kosyhgmail.com>

pkgname=instead
pkgver=3.1.2
pkgrel=1
pkgdesc="a quest interpreter"
arch=('x86_64')
url="http://sourceforge.net/projects/instead/"
license=('MIT')
depends=('sdl_image' 'sdl_mixer' 'sdl_ttf' 'lua' 'gtk2')
makedepends=('cmake')
optdepends=('instead-launcher: install and update INSTEAD games from net')
source=(http://downloads.sourceforge.net/project/instead/instead/${pkgver}/instead_${pkgver}.tar.gz)
sha256sums=('e1990bf8d48471fbc8fce60914e343df6bff87eac9cfbfad7d980c56c54e9282')

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
