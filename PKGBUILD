# Maintainer: Florian Walch <florian+aur@fwalch.com>

pkgbase=lua-mpack
pkgname=('lua51-mpack')
pkgver=1.0.2
pkgrel=2
arch=('i686' 'x86_64')
url='https://github.com/tarruda/libmpack'
makedepends=('lua51')
license=('MIT')
source=("libmpack-${pkgver}.tar.gz::https://github.com/tarruda/libmpack/archive/${pkgver}.tar.gz")
sha256sums=('9c570b2aab81b0c56d97cbd8fc483dc431b69510fd9becb4a1845291563e8bc9')

package_lua51-mpack() {
  pkgdesc='Implementation of MessagePack for Lua 5.1'
  depends=('lua51')

  cd "${srcdir}/libmpack-${pkgver}"
  gcc -O2 -fPIC -I/usr/include/lua5.1 -c binding/lua/lmpack.c -o lmpack.o
  gcc -shared -o mpack.so lmpack.o
  install -Dm755 mpack.so "${pkgdir}/usr/lib/lua/5.1/mpack.so"
  install -Dm644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set sw=2 sts=2 et:
