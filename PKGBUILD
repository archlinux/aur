# Maintainer: pyz3n

pkgname=weechat-matrix-git
pkgver=r348.ace3fef
pkgrel=1
pkgdesc="weechat script for matrix"
arch=('any')
url='https://github.com/torhve/weechat-matrix-protocol-script'
license=('MIT')
depends=('weechat' 'lua' 'lua-cjson')
makedepends=('git')
source=("${pkgname}::git+https://github.com/torhve/weechat-matrix-protocol-script")
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/$pkgname"
    install -d "$pkgdir/$HOME/.weechat/lua/{,autoload}"
    install -D "matrix.lua" "$HOME/.weechat/lua"
    [ -h "$HOME/.weechat/lua/autoload/matrix.lua" ] \
    || ln -s "$HOME/.weechat/lua/matrix.lua" "$HOME/.weechat/lua/autoload/matrix.lua"
}
