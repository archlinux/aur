# Maintainer: spider-mario <spidermario@free.fr>
# Maintainer of `lv2`: Ray Rashif <schiv@archlinux.org>

pkgname=mingw-w64-lv2
pkgver=1.16.0
pkgrel=1
pkgdesc="Successor to the LADSPA audio plug-in standard (mingw-w64)"
url="http://lv2plug.in/"
license=('LGPL' 'custom')
arch=('any')
depends=('mingw-w64-crt')
optdepends=('mingw-w64-pkg-config' 'mingw-w64-gcc')
makedepends=('python2')
source=("http://lv2plug.in/spec/lv2-$pkgver.tar.bz2")
sha512sums=('ead6d590cded5dd7a548d6ffe0f2f9f8efadfa7bb9e8b4fa0aea6664ccdfbb3ca697514bddebe695a9442fba5b62714b5cd45c1bf7d0aaef12ffe50972c2d88c')

_architectures=('i686-w64-mingw32' 'x86_64-w64-mingw32')

package() {
  cd lv2-$pkgver

  for _arch in "${_architectures[@]}"; do
    # No need to build, we only install headers and static files.
    python2 waf configure --prefix=/usr/"$_arch" --no-plugins
    python2 waf install --destdir="$pkgdir"
    rm -fr "$pkgdir"/usr/*/{bin,share}
  done

  install -Dm644 COPYING \
    "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
