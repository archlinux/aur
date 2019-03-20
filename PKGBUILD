# Maintainer: Damjan Georgievski <gdamjan@gmail.com>

pkgname=nginx-mod-nchan
pkgver=1.2.5
pkgrel=1

_nginxver=1.14.2

pkgdesc='nchan nginx module'
arch=('i686' 'x86_64')
depends=('nginx')
url="https://nchan.io/"
license=('MIT')

source=(
    https://github.com/slact/nchan/archive/v${pkgver}.tar.gz
    http://nginx.org/download/nginx-$_nginxver.tar.gz
)
sha256sums=('45d5dd0411238eee1694e36a476c33d88d83f83971316d2e00bc0bf46eeb7a4f'
            '002d9f6154e331886a2dd4e6065863c9c1cf8291ae97a1255308572c02be9797')

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

