# Maintainer: Frank Seifferth <frankseifferth@posteo.net>
pkgname=editorconfig-core-lua-git
_pkgname=editorconfig-core-lua
conflicts=('editorconfig-core-lua')
pkgver=latest
pkgrel=1
pkgdesc="EditorConfig Core bindings for Lua"
arch=('any')
url="https://github.com/editorconfig/editorconfig-core-lua"
license=('custom:BSD')
depends=('lua' 'editorconfig-core-c')
makedepends=('git' 'cmake')
source=("$pkgname::git+https://github.com/editorconfig/editorconfig-core-lua")
md5sums=('SKIP')

pkgver() {
    echo r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
    cd "$srcdir/$pkgname"
    cmake .
    make
}

package() {
    install -Dm 755 "$srcdir/$pkgname/editorconfig.so" \
                    "$pkgdir/usr/lib/lua/5.4/editorconfig.so"
    install -Dm 644 "$srcdir/$pkgname/LICENSE" \
                    "$pkgdir/usr/share/licenses/editorconfig-core-lua/LICENSE"
}
