# $Id$
# Maintainer: Martchus <martchus@gmx.net>

pkgname=nginx-mod-accesskey
pkgver=2.0.5
pkgrel=10
_dirname="nginx-accesskey-$pkgver"
_nginxver=1.22.0

pkgdesc='Accesskey module for NGINX'
arch=('x86_64')
depends=("nginx=$_nginxver" "libutil-linux")
makedepends=("nginx-src")
url='https://github.com/Martchus/nginx-accesskey'
license=('unknown')

source=("$pkgname-$pkgver::https://github.com/Martchus/nginx-accesskey/archive/v${pkgver}.tar.gz")
sha256sums=('f7cb363fb527dfda202009942ed3b1bb98e5ef9723893aa0beba22adf9b1a246')

prepare() {
  cd "$srcdir/$_dirname"
}

build() {
  cp -r /usr/src/nginx .
  cd "$srcdir"/nginx
  ./configure --with-compat --add-dynamic-module="../$_dirname"
  make modules
}

package() {
  cd "$srcdir"/nginx/objs
  for mod in ngx_*.so; do
    install -Dm755 $mod "$pkgdir"/usr/lib/nginx/modules/$mod
  done
}
