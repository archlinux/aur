# Maintainer: Damjan Georgievski <gdamjan@gmail.com>

pkgname=nginx-mainline-mod-nchan
pkgver=1.2.4
pkgrel=1

_nginxver=1.15.9

pkgdesc='nchan nginx module'
arch=('i686' 'x86_64')
depends=("nginx-mainline=${_nginxver}")
url="https://nchan.io/"
license=('MIT')

source=(
    http://nginx.org/download/nginx-$_nginxver.tar.gz
    https://github.com/slact/nchan/archive/v${pkgver}.tar.gz
)

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

sha256sums=('e4cfba989bba614cd53f3f406ac6da9f05977d6b1296e5d20a299f10c2d7ae43'
            '30ba62574b347cc1116567f95918d431588bc90a1d5fe903230ccad0dcb756cb')
