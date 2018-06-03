# Maintainer: getzze <getzze at gmail dot com>

pkgname=('python-persisting-theory' 'python2-persisting-theory')
pkgver=0.2.1
pkgrel=1
pkgdesc="Registries that can autodiscover values accross your project apps"
arch=(any)
url="https://code.eliotberriot.com/eliotberriot/persisting-theory"
license=('BSD')
options=(!emptydirs)
source=('https://code.eliotberriot.com/eliotberriot/persisting-theory/-/archive/develop/persisting-theory-develop.tar.gz')
sha256sums=('8dec8a5fd3f87b57cdd7dff18220fe3060841cabafef3defbb4cafd0f8e1d85a')
makedepends=('python-setuptools' 'python2-setuptools')

prepare() {
  cd "$srcdir/persisting-theory-develop"
  rm -rf {example,tests}
  #sed -i "s/find_packages()/find_packages(exclude=['example', 'tests'])/g" setup.py
  sed -i "s#recursive-include example#recursive-exclude example *\nrecursive-exclude tests *#g" MANIFEST.in
}

package_python-persisting-theory() {
  depends=('python')
  cd "$srcdir/persisting-theory-develop"
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-persisting-theory() {
  depends=('python2')
  cd "$srcdir/persisting-theory-develop"
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
