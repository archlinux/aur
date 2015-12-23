# Maintainer: Colin Pitrat <colin dot pitrat at gmail dot com>
pkgname=geophar
pkgver=15.10.2
pkgrel=1
pkgdesc="The swiss-knife of math teachers. Simple tool to produce beautiful mathematical pictures."
arch=('any')
url="http://wxgeo.free.fr/"
license=('GPL2')
depends=('python2-qscintilla')
source=(http://downloads.sourceforge.net/project/geophar/Geophar/version_$pkgver/geophar_$pkgver.tar.gz)
sha256sums=('8d218f163ab25c8ac09e03bd0d00f7bc8c27a105389f35332de6be4da81bbd05')

package() {
  mkdir -p $pkgdir/opt
  cp -r $srcdir/* $pkgdir/opt/
  mkdir -p $pkgdir/usr/bin
  ln -s /opt/geophar/geophar.pyw $pkgdir/usr/bin/geophar
  mkdir $pkgdir/opt/geophar/config
  chmod a+w $pkgdir/opt/geophar/config

  # Forces usage of python2
  sed -i 's,#!/usr/bin/env python$,#!/usr/bin/env python2,' $pkgdir/opt/geophar/geophar.pyw `grep -rlI "^#!/usr/bin/env python$" $pkgdir/opt/geophar`
  sed -i 's,#!/usr/bin/python$,#!/usr/bin/python2,' `grep -rlI "#!/usr/bin/python$" $pkgdir/opt/geophar`
}
