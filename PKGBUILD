# Maintainer: Eric Berquist <eric DOT berquist AT gmail DOT com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Sébastien Luttringer
# Contributor: SpepS <dreamspepser at yahoo dot it>
# Contributor: Laszlo Papp <djszapi at archlinux us>
# Contributor: Donald Ephraim Curtis <dcurtis@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

_pkgname=lua-posix
pkgname="${_pkgname}-git"
pkgver=33.4.0.r158.g69c6195
pkgrel=1
pkgdesc='POSIX library for Lua'
arch=('x86_64' 'i686')
url='https://github.com/luaposix/luaposix'
license=('MIT')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
depends=('lua' 'lua-std-normalize')
makedepends=('git' 'help2man' 'ldoc')
options=('!makeflags')
source=("${_pkgname}::git://github.com/luaposix/luaposix.git")
md5sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --tags --abbrev=7 HEAD |
    sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${_pkgname}"
  ./build-aux/luke all
}

package() {
  cd "${_pkgname}"
  ./build-aux/luke PREFIX="${pkgdir}"/usr install
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
}
