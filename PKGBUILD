# Maintainer: Janne Veteläinen <janne.p.w.vetelainen@gmail.com>

_pkgname=fzy-lua
pkgname=lua-fzy
pkgver=1.0.3
pkgrel=1
pkgdesc="Lua fzf matching library"
arch=('x86_64')
url="https://github.com/swarn/fzy-lua"
license=('MIT')
depends=('lua' 'glibc')
makedepends=('luarocks')
checkdepends=('busted')
conflicts=('lua-fzy-purelua')
source=(
    "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=('11e13743ed7f60b68c55cff028760480ab5ea1ed0fd13ff6de64cac7fbc22d88')

build() {
    cd "$_pkgname-$pkgver"
    luarocks make --deps-mode=none --pack-binary-rock fzy-scm-1.rockspec
}

package() {
    cd "$_pkgname-$pkgver"
    luarocks install --tree=${pkgdir}/usr --deps-mode=none --no-manifest *.rock
    install -Dm644 ./LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

check() {
    cd "$_pkgname-$pkgver"
    export LD_LIBRARY_PATH="$_pkgname-$pkgver:$LD_LIBRARY_PATH"
    busted
}
