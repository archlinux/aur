# Contributor: Tim Hatch <tim@timhatch.com>
# Maintainer: Jozef Riha <jose1711 at gmail dot com>

pkgname=luadec51-git
pkgdesc="Disassembler for Lua compiled bytecode (git)"
pkgver=r13.35cddc8
pkgrel=2
_luaver=5.1.5
arch=('i686' 'x86_64')
url="https://github.com/sztupy/luadec51/wiki"
license=('MIT')
depends=(lua)
source=("${pkgname}"::'git+https://github.com/sztupy/luadec51.git'
        "https://gentoo.osuosl.org/distfiles/lua-${_luaver}.tar.gz"
)
md5sums=('SKIP'
         '2e115fe26e435e33b0d5c022e4490567')

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
