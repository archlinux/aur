# Maintainer: Eric Berquist <eric DOT berquist AT gmail DOT com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Sébastien Luttringer
# Contributor: SpepS <dreamspepser at yahoo dot it>
# Contributor: Laszlo Papp <djszapi at archlinux us>
# Contributor: Donald Ephraim Curtis <dcurtis@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

_pkgname=lua-posix
pkgname="${_pkgname}-git"
pkgver=33.4.0.136.g69c1799
pkgrel=1
pkgdesc='POSIX library for Lua'
arch=('x86_64')
url='https://github.com/luaposix/luaposix'
license=('MIT')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
depends=('lua')
makedepends=('git' 'help2man' 'ldoc')
options=('!makeflags')
source=("${_pkgname}::git://github.com/luaposix/luaposix.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --always | sed 's+^v++' | sed 's+-+.+g'
}

build() {
  cd "${srcdir}/${_pkgname}"

  ./build-aux/luke \
      all
}

package() {
  cd "${srcdir}/${_pkgname}"

  ./build-aux/luke \
      PREFIX="${pkgdir}"/usr \
      install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
