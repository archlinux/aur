# Maintainer: hachi mohamed <hachiassali15@gmail.com>
pkgname="php-openswoole-git"
pkgver=22.1.2
pkgrel=1
pkgdesc="Programmatic Server for PHP with Async IO, Coroutines and Fibers"
arch=('any')
url="https://openswoole.com/"
license=('unkown')
depends=("php>=8.1.0")
makedepends=("git" "gcc>=4.8")
provides=("openswoole.so=$pkgver")
source=("$pkgname::git+https://github.com/openswoole/ext-openswoole.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --tags
}

build() {
    cd "$pkgname"
    phpize
    ./configure
    make
}

package() {
    cd "$pkgname"
    make INSTALL_ROOT=${pkgdir} install
    echo "extension=openswoole.so" > openswoole.ini
    install -D -m644 openswoole.ini "${pkgdir}/etc/php/conf.d/openswoole.ini"
}
