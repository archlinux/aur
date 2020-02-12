# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: meskarune <admin@doloresportalatin.info>

_rockname=unix
_project=l$_rockname
pkgname=("lua-$_rockname" "lua52-$_rockname" "lua51-$_rockname")
pkgver=20190403
pkgrel=1
pkgdesc='Lua bindings for common *nix system APIs'
arch=('x86_64')
url="https://github.com/wahern/$_project"
license=('MIT')
makedepends=('lua' 'lua51' 'lua52')
source=("$_project-$pkgver.tar.gz::https://github.com/wahern/$_project/archive/rel-$pkgver.tar.gz")
sha256sums=('e27ee456f30aa1b6d93ebe079a274764eda81308655612dd68edfb7deede7563')
_tardir="$_project-rel-$pkgver"

build() {
    cd "$_tardir"
    make prefix=/usr all
}

_package_helper() {
    cd "$_tardir"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
    make prefix=/usr DESTDIR="$pkgdir" install"$1"
}

package_lua-unix() {
    depends+=('lua')
    _package_helper 5.3
}

package_lua52-unix() {
    depends+=('lua52')
    _package_helper 5.2
}

package_lua51-unix() {
    depends+=('lua51')
    _package_helper 5.1
}
