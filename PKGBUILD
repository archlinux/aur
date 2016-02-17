# Contributor: Evaggelos Balaskas < Evaggelos _AT_ Balaskas _DOT_ GR >
# Maintainer:  Evaggelos Balaskas < Evaggelos _AT_ Balaskas _DOT_ GR >

_pkg=lua-sodium
pkgname=$_pkg-git
pkgver=git
pkgrel=1
pkgdesc="Lua bindings for libsodium"
url="https://github.com/morfoh/lua-sodium"

arch=('any')
license=('custom:LUA')

makedepends=('git' 'cmake' 'gcc')
depends=('lua')

conflicts=(${_pkg})

source=(
        ${pkgname}::git+https://github.com/morfoh/${_pkg}.git
        LICENSE
)
sha256sums=('SKIP'
            'd721188f005e40b430f556e8bd83ff90591f77bd343073be2037f94705818c5c'
) 

pkgver() {
    date +%Y%m%d
}

build() {
    cd $srcdir/$pkgname
    LUA_VERSION=`lua -v | grep -o '5\.[0-9]'`
    cmake ./ -DINSTALL_CMOD=${pkgdir}/usr/lib/lua/${LUA_VERSION}
}

package() {
    cd $srcdir/$pkgname
    make install

    # Install License
    install -Dm644 ../LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim: tabstop=4 expandtab shiftwidth=4 softtabstop=4
