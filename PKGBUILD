# Maintainer: Evgeniy Alekseev <arcanis.arch at gmail dot com>
# Contributor: Sebastien Binet <binet at cern dot ch>

pkgname=python2-cyrano
pkgver=0.1.4
pkgrel=1
pkgdesc="Tool used for demonstrating Python packages that combines a display window and an IPython shell."
url="http://stsdas.stsci.edu/cyrano"
arch=('i686' 'x86_64')
license=('BSD')
conflicts=('python-cyrano')
provides=('python-cyrano')
replaces=('python-cyrano')
depends=('ipython2' 'python2-pmw')
source=(http://stsdas.stsci.edu/cyrano/cyrano-${pkgver}.tar.gz)
md5sums=('5ba2fb588dd6c10385de34b4a46d8966')

prepare() {
  cd "${srcdir}/cyrano-${pkgver}"
  sed -i "s/python/python2/g" "cyrano"
  sed -i "s/python/python2/g" "demos/install_and_run"
  sed -i "s/python/python2/g" "lib/cyrano.py"
}

build() {
  cd "${srcdir}/cyrano-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/cyrano-${pkgver}"
  python2 setup.py install --prefix=/usr --root="${pkgdir}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

