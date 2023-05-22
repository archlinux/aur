# Maintainer: Jelle van der Waa <jelle@archlinux.org>
# Contributor: Giovanni Harting <539@idlegandalf.com>

_modname="nginx-module-vts"
pkgname=nginx-mod-vts
pkgver=0.2.1
pkgrel=3
pkgdesc="Nginx virtual host traffic status module"
arch=('x86_64')
depends=('nginx')
makedepends=('nginx-src')
url="https://github.com/vozlt/nginx-module-vts"
license=('BSD')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/vozlt/$_modname/archive/v$pkgver.tar.gz)
sha256sums=('1a63d78d3ae4df18b3a57a616eeee006cdc0bd71aa7ea2947046004b123704f4')

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
