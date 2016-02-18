# Maintainer: lykwydchykyn <me at alan d moore dot com>
#

pkgname=invada-studio-plugins
pkgver=0.3.1
pkgrel=1
pkgdesc="LADSPA audio effect plugins from invada, ported from VST.  You probably want the LV2 versions, this is provided for compatibility."
arch=('i686' 'x86_64')
url="https://launchpad.net/invada-studio/"
license=('GPL2')
groups=('ladspa-plugins')
depends=('glibc')
makedepends=('ladspa')
source=("https://launchpad.net/invada-studio/ladspa/0.3/+download/${pkgname}_${pkgver}-nopkg.tar.gz")
md5sums=('e67fb0db1efd70aa6b340dbff7173420')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i "s|/usr/local|${pkgdir}/usr|g" Makefile
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  echo $pkgdir
  make INSTALL_SYS_PLUGINS_DIR="${pkgdir}"/usr/lib/ladspa \
       DESTDIR="$pkgdir" install
}
