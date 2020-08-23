# Maintainer: spider-mario <spidermario@free.fr>
# Maintainer of `lv2`: Ray Rashif <schiv@archlinux.org>

pkgname=mingw-w64-lv2
pkgver=1.18.0
pkgrel=1
pkgdesc="Successor to the LADSPA audio plug-in standard (mingw-w64)"
url="http://lv2plug.in/"
license=('LGPL' 'custom')
arch=('any')
depends=('mingw-w64-crt')
optdepends=('mingw-w64-pkg-config' 'mingw-w64-gcc')
makedepends=('python2')
source=("http://lv2plug.in/spec/lv2-$pkgver.tar.bz2")
sha512sums=('9e8dd9c1f30371260d21efc105b1d4d4ad03d9e332d4d3877d873f20b9527bcd0e917ff23fc6e0a9cc4337bda85882c742f225f7cf4fbc8a8a0964565c91f9d9')

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
