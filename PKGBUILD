pkgname=lua4
pkgver=4.0.1
pkgrel=1
pkgdesc="Lua is a powerful, efficient, lightweight, embeddable scripting language."
arch=('x86_64')
url="https://www.lua.org/versions.html#4.0"
licenses=('GNU-like copyleft')
depends=('lib32-glibc' 'lib32-gcc-libs')
makedepends=('make')
source=("https://www.lua.org/ftp/lua-4.0.1.tar.gz")
sha256sums=('df746e149cf6939e90009d2e540eee918d585b4d1bc6d68b19316a050d484d2a')

prepare() {
    cd "$srcdir/lua-${pkgver}"
    patch --forward --strip=1 --input=../../make.patch
    mv $srcdir/lua-${pkgver}/doc/lua.1 $srcdir/lua-${pkgver}/doc/lua4.1
    mv $srcdir/lua-${pkgver}/doc/luac.1 $srcdir/lua-${pkgver}/doc/luac4.1
    mkdir -p $pkgdir/usr
}

build() {
    cd "$srcdir/lua-${pkgver}"
    make
}

package() {
    make -C "$srcdir/lua-${pkgver}" INSTALL_ROOT=$pkgdir/usr install
}
