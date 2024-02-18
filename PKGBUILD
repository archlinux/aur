# Maintainer: Giovanni Harting <539@idlegandalf.com>

pkgname=nginx-mainline-mod-vts
pkgver=0.2.2
pkgrel=1
_modname="nginx-module-vts"
pkgdesc='Nginx virtual host traffic status module (module for mainline nginx)'
arch=(x86_64)
depends=(nginx-mainline)
makedepends=(nginx-mainline-src)
url="https://github.com/vozlt/nginx-module-vts"
license=(BSD-2-Clause)
source=("$_modname-$pkgver.tar.gz::https://github.com/vozlt/nginx-module-vts/archive/v$pkgver.tar.gz")
b2sums=('07c24eb62feeb145705ef07dc08feaa06b6b68f80b08e43ff8435bcd1ddbce2ce2d9adffd33efe635678eb787e39d9532f5fb0c22cedd2cb58445b2df14f96f5')

build() {
  cp -r /usr/src/nginx .

  cd nginx
  ./configure --with-compat --add-dynamic-module=../$_modname-$pkgver
  make modules
}

package() {
  install -Dm0644 "$_modname-$pkgver"/LICENSE "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE

  cd nginx/objs
  for mod in *.so; do
      install -Dm755 $mod "$pkgdir"/usr/lib/nginx/modules/$mod
  done
}

# vim:set ts=2 sw=2 et:
