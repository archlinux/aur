# Maintainer: spider-mario <spidermario@free.fr>
# Maintainer of `lv2`: Ray Rashif <schiv@archlinux.org>

pkgname=mingw-w64-lv2
pkgver=1.14.0
pkgrel=1
pkgdesc="Successor to the LADSPA audio plug-in standard (mingw-w64)"
url="http://lv2plug.in/"
license=('LGPL' 'custom')
arch=('any')
depends=('mingw-w64-crt')
optdepends=('mingw-w64-pkg-config' 'mingw-w64-gcc')
makedepends=('python2')
source=("http://lv2plug.in/spec/lv2-$pkgver.tar.bz2")
sha512sums=('6991d848ed9f04a48ca3070efc15af83431f680aa8a8559a02b1666f7b8d43af8e089f78c3b14ad3345dac32fd1c8ad0faf3a3f56dddc07c6f0e0aeef4077498')

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
