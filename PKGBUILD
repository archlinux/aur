#Maintainer: Viktor Semykin <thesame.ml@gmail.com>

pkgname=luadec-git
pkgdesc="Decompiler for lua 5.1 , and experimental for lua 5.2 and 5.3"
pkgrel=1
pkgver=r219.895d923
arch=('i686' 'x86_64')
url="https://github.com/viruscamp/luadec"
license=('MIT')
depends=()
makedepends=('git')
source=("${pkgname}"::'git+https://github.com/viruscamp/luadec')
md5sums=('SKIP')
conflicts=('luadec51-git')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/$pkgname"
    git submodule update --init lua-5.1
}

build() {
    cd "$srcdir/$pkgname/lua-5.1"
    make linux
    cd "$srcdir/$pkgname/luadec"
    make LUAVER=5.1
}

package() {
    install -Dm755 "${srcdir}/$pkgname/luadec/luadec" "${pkgdir}/usr/bin/luadec"
    install -Dm755 "${srcdir}/$pkgname/luadec/luaopswap" "${pkgdir}/usr/bin/luaopswap"
    install -Dm755 "${srcdir}/$pkgname/luadec/luareplace" "${pkgdir}/usr/bin/luareplace"
}
