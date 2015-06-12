# Contributor: Tim Hatch <tim@timhatch.com>
# Maintainer: Jozef Riha <jose1711 at gmail dot com>

pkgname=luadec51-git
pkgdesc="Disassembler for Lua compiled bytecode (git)"
pkgver=r13.35cddc8
pkgrel=1
_luaver=5.1.4
arch=('i686' 'x86_64')
url="https://github.com/sztupy/luadec51/wiki"
license=('MIT')
depends=(lua)
source=("${pkgname}"::'git+https://github.com/sztupy/luadec51.git'
http://gentoo.mirrors.pair.com/distfiles/lua-${_luaver}.tar.gz
)
md5sums=('SKIP'
         'd0870f2de55d59c1c8419f36e8fac150')

pkgver() {
  cd "$srcdir/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  mv -i ${srcdir}/lua-${_luaver}/* ${srcdir}/${pkgname}/lua
  cd ${srcdir}/${pkgname}/build
  make linux
}

package() {
  install -Dm755 ${srcdir}/${pkgname}/build/luadec ${pkgdir}/usr/bin/luadec
}
