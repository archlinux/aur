# Maintainer: Cedric Mathieu <me.xenom[at]gmail.com>

pkgname=gambatte-git
_gitname="gambatte"
pkgver=f3c548d
pkgrel=1
pkgdesc="An accuracy-focused Game Boy Color emulator"
arch=('i686' 'x86_64')
url="https://github.com/sinamas/gambatte"
license=('GPL')
depends=('gcc-libs' 'sdl' 'zlib')
optdepends=('gambatte-qt: Qt4 frontend')
makedepends=('git' 'scons')
provides=('gambatte')
conflicts=('gambatte')
source=('git://github.com/sinamas/gambatte.git')
md5sums=('SKIP')


pkgver() {
  cd "$_gitname"
  git describe --always | sed 's|-|.|g'
}



build() {
  cd "$_gitname"

  for i in libgambatte gambatte_sdl; do
    cd $i
    scons CXXFLAGS="${CXXFLAGS}" || return 1
    cd ..
  done
}

package() {

  cd "$_gitname"

  install -Dm755 gambatte_sdl/gambatte_sdl "$pkgdir"/usr/bin/gambatte
  install -Dm644 libgambatte/libgambatte.a "$pkgdir"/usr/lib/libgambatte.a
}

# vim:set ts=2 sw=2 et:
