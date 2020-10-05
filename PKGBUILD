# Maintainer: tjbp (archlinux@tjbp.net)

pkgname='php-lua'
pkgver='2.0.7'
pkgrel='1'
pkgdesc='PHP PECL extension for an embedded Lua interpreter'
arch=('i686' 'x86_64')
url='https://pecl.php.net/package/lua'
license=('PHP')
depends=('php>=7.0.0' 'lua')
source=(
    "http://pecl.php.net/get/lua-$pkgver.tgz"
)
sha256sums=(
    '86545e1e09b79e3693dd93f2a5a8f15ea161b5a1928f315c7a27107744ee8772'
)

build() {
    cd "$srcdir/lua-$pkgver"
    phpize
    /usr/bin/sh configure \
    --prefix=/usr \
    --with-lua=/usr
    make
    echo 'extension=lua.so' > lua.ini
}

package() {
    pushd "$srcdir/lua-$pkgver"
    make INSTALL_ROOT="$pkgdir" install
    install -Dm644 lua.ini "$pkgdir/etc/php/conf.d/lua.ini"
    popd
}
