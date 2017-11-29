# Maintainer: Damjan Georgievski <gdamjan@gmail.com>

pkgname=nginx-mod-nchan
pkgver=1.1.11
pkgrel=1

_nginxver=1.12.2

pkgdesc='nchan nginx module'
arch=('i686' 'x86_64')
depends=('nginx')
url="https://nchan.io/"
license=('MIT')

source=(
    http://nginx.org/download/nginx-$_nginxver.tar.gz
    https://github.com/slact/nchan/archive/v${pkgver}.tar.gz
)
sha256sums=('305f379da1d5fb5aefa79e45c829852ca6983c7cd2a79328f8e084a324cf0416'
            '5bc0b1f87811d273adf79c6cb8f455651a953575d787a702c4f461c16ad08d00')

build() {
    cd "$srcdir"/nginx-$_nginxver
    _module_dir="$srcdir"/nchan-$pkgver
    ./configure --with-compat --add-dynamic-module=${_module_dir}
    make modules
}

package() {
    cd "$srcdir"/nginx-$_nginxver/objs
    for _mod in ngx_nchan_module.so; do
        install -Dm755 $_mod "$pkgdir"/usr/lib/nginx/modules/$_mod
    done
}

