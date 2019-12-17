# Maintainer: darkfeline@felesatra.moe

pkgname=non-mixer-lv2-git
pkgver=1.2.0.r8.g41a318f
pkgrel=1
pkgdesc="Jack audio mixer from the NON DAW + LV2 plugin patch by falkTX and others"
arch=('x86_64' 'i686')
url="http://non.tuxfamily.org/"
license=('GPL2')
provides=('non-mixer' 'non-mixer-lv2-git')
conflicts=('non-mixer' 'non-mixer-git' 'non-mixer-lv2-git')
depends=('ntk-git' 'jack' 'liblo' 'ladspa' 'liblrdf' 'lv2' 'lilv')
makedepends=('git')
source=('git+https://github.com/mxmilkb/non.git')
md5sums=('SKIP')

pkgver() {
  cd $srcdir/non
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/^non-daw-v//;s/-/./g'
}

build() {
  cd $srcdir/non
  ./waf configure --prefix=/usr --project=mixer
  ./waf
}

package() {
  cd $srcdir/non
  ./waf install --destdir="$pkgdir"
}
