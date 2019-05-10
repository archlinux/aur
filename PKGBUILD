# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=strict
pkgname=lua-$_pkgname
pkgver=1.1
_luaver=5.3
pkgrel=1
pkgdesc='Pure Lua library for detecting access to uninitialized variables'
arch=('any')
url='https://github.com/lua-stdlib/strict'
license=('MIT')
depends=('lua')
makedepends=('ldoc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('f6a7028f51330122fd1ebf42b79d759380d7ee6f168f17b3915544b1045830b872e3f9235ffee29da9ac041b24e76f47f41997a502fa3115ec28186cb5a2c096')

build(){
    cd $_pkgname-$pkgver

    # Generate docs
    make
}

package() {
    cd $_pkgname-$pkgver

    # Install source
    install -dm 755 "$pkgdir"/usr/share/lua/{$_luaver,5.2,5.1}
    cp -a --no-preserve=ownership lib/std "$pkgdir"/usr/share/lua/$_luaver
    ln -s /usr/share/lua/$_luaver/std "$pkgdir"/usr/share/lua/5.2/std
    ln -s /usr/share/lua/$_luaver/std "$pkgdir"/usr/share/lua/5.1/std

    # Install docs
    install -Dm 644 doc/index.html "$pkgdir"/usr/share/doc/$pkgname/index.html
    install -Dm 644 doc/ldoc.css "$pkgdir"/usr/share/doc/$pkgname/ldoc.css

    # License
    install -Dm 644 LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
