# Maintainer: Damjan Georgievski <gdamjan@gmail.com>

pkgname=nginx-mainline-mod-nchan
pkgver=1.1.6
pkgrel=2

_nginxver=1.13.3

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

sha256sums=('5b73f98004c302fb8e4a172abf046d9ce77739a82487e4873b39f9b0dcbb0d72'
            'df037766e3a152d8cf2a8b644dd10db8cac3679523adc3c063d41ffeb20d43bc')
