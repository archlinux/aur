# Maintainer: Damjan Georgievski <gdamjan@gmail.com>

pkgname=nginx-mainline-mod-nchan
pkgver=1.2.5
pkgrel=4

_nginxver=1.15.12

pkgdesc='nchan nginx module'
arch=('i686' 'x86_64')
depends=("nginx-mainline=${_nginxver}")
url="https://nchan.io/"
license=('MIT')

source=(
    https://github.com/slact/nchan/archive/v${pkgver}.tar.gz
    http://nginx.org/download/nginx-$_nginxver.tar.gz
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

sha256sums=('45d5dd0411238eee1694e36a476c33d88d83f83971316d2e00bc0bf46eeb7a4f'
            '3d5b90aa17de1700709ae4ec6c4d73d87c888b06c510391bf7104b006fdb2abe')
