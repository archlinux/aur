# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>

pkgbase=gambatte
pkgname=('gambatte-qt' 'gambatte-sdl')
pkgver=r572
pkgrel=2
arch=('x86_64')
url='https://github.com/sinamas/gambatte'
license=('GPL2')
makedepends=('git' 'qt4' 'scons' 'sdl')
source=(git://github.com/sinamas/gambatte.git#commit=46e06da8)
md5sums=('SKIP')

pkgver() {
  cd $pkgbase
  printf "r%s" "$(git rev-list --count @)"
}

build() {
  cd $pkgbase

  pushd libgambatte
  scons
  popd

  pushd gambatte_qt
  qmake-qt4
  make
  popd

  pushd gambatte_sdl
  scons
  popd
}

package_gambatte-qt() {
  pkgdesc='Accurate Game Boy Color emulator. Qt4 UI.'
  depends=('qt4')

  install -Dm755 $pkgbase/gambatte_qt/bin/gambatte_qt \
    "$pkgdir"/usr/bin/gambatte-qt
}

package_gambatte-sdl() {
  pkgdesc='Accurate Game Boy Color emulator'
  depends=('gcc-libs' 'sdl' 'zlib')

  install -Dm755 $pkgbase/gambatte_sdl/gambatte_sdl \
    "$pkgdir"/usr/bin/gambatte-sdl
}
