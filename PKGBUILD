# Maintainer: Damjan Georgievski <gdamjan@gmail.com>

pkgname=nginx-mod-nchan
pkgver=1.2.3
pkgrel=2

_nginxver=1.14.1

pkgdesc='nchan nginx module'
arch=('i686' 'x86_64')
depends=('nginx')
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

sha256sums=('bf09974130c0d41c0a811decc17a96ec2f58cdc8bbacb771de8d38c9ba14a4a4'
            'ea44d9f33115db4737abe611e63e3f734fa18cb11d998354b093a40eb7a8e6be')
