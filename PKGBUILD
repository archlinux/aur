# Maintainer: Damjan Georgievski <gdamjan@gmail.com>

pkgname=nginx-mainline-mod-nchan
pkgver=1.2.8
pkgrel=2

_nginxver=1.21.0

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
    _module_dir="$srcdir"/nchan-$pkgver

    cd "$srcdir"/nginx-$_nginxver
    ./configure --with-compat --add-dynamic-module=${_module_dir}
    make modules
}

package() {
    cd "$srcdir"/nginx-$_nginxver/objs
    for _mod in ngx_nchan_module.so; do
        install -Dm755 $_mod "$pkgdir"/usr/lib/nginx/modules/$_mod
    done
}

sha256sums=('de42e8d4fef6aef9e4c7303a7480adfe9545992470a7f6be008de7a4bb64cc98'
            'fe192a4bac2bd3a769e8695cb9fe14a00e57eaceb919095347a83b5b2afc0771')
