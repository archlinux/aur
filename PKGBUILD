# Maintainer: Damjan Georgievski <gdamjan@gmail.com>

pkgname=nginx-mainline-mod-nchan
pkgver=1.1.7
pkgrel=1

_nginxver=1.13.4

pkgdesc='nchan nginx module'
arch=('i686' 'x86_64')
depends=('nginx-mainline')
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

sha256sums=('de21f3c49ba65c611329d8759a63d72e5fcf719bc6f2a3270e2541348ef1fbba'
            'c8ae7791560ef19a0fec459f424366a09e3baf52ab0fc4938ffce8d962b6abd6')
