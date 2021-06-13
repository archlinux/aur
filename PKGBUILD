# Maintainer: Jelle van der Waa <jelle@archlinux.org>
# Contributor: Giovanni Harting <539@idlegandalf.com>

_modname="nginx-module-vts"
pkgname=nginx-mod-vts
pkgver=0.1.18
pkgrel=4
pkgdesc="Nginx virtual host traffic status module"
arch=('x86_64')
depends=('nginx')
makedepends=('nginx-src')
url="https://github.com/vozlt/nginx-module-vts"
license=('BSD')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/vozlt/$_modname/archive/v$pkgver.tar.gz)
sha256sums=('17ea41d4083f6d1ab1ab83dad9160eeca66867abe16c5a0421f85a39d7c84b65')

build() {
    cp -r /usr/src/nginx .

    cd nginx
    ./configure --with-compat --add-dynamic-module=../$_modname-$pkgver
    make modules
}

package() {
    install -Dm0644 "nginx-module-vts-$pkgver"/LICENSE "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE

    cd nginx/objs
    for mod in *.so; do
        install -Dm755 $mod "$pkgdir"/usr/lib/nginx/modules/$mod
    done
}
