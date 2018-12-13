# Maintainer: tjbp (archlinux@tjbp.net)

pkgname='php-lua'
pkgver='2.0.5'
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
    'bb49431ce5494ebebba98d9c477537df97234e13d4bd46529809ca1a2b8c287e'
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
