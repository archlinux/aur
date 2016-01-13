# Maintainer: tjbp (archlinux@tjbp.net)

pkgname='php-lua'
pkgver='2.0.0'
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
    '774ef6c27c778f5f40b9c701eebd7d554ed2a0d4809bf6849aed83664f3df58f'
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
