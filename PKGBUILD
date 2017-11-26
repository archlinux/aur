# Maintainer: Christoph Scholz <christoph.scholz@gmail.com>
pkgdesc="A tile cache and WMS proxy."
pkgbase=python-mapproxy
pkgname=('python-mapproxy' 'python2-mapproxy')
pkgver=1.11.0
pkgrel=1
arch=('any')
url="https://github.com/mapproxy/mapproxy"
license=('APACHE')
makedepends=('python-setuptools' 'python2-setuptools')
source=("mapproxy-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('f051ee400b50f9a4f20467e04c736c442e0bed71cf25f7c5e878a2603114cc5f')

build() {
  cp -rf mapproxy-${pkgver} mapproxy2-${pkgver}
  cd $srcdir/mapproxy-${pkgver}
  python setup.py build 
  cd $srcdir/mapproxy2-${pkgver}
  python2 setup.py build
}

package_python-mapproxy() {
depends=('python' 'python-pillow' 'python-yaml' 'python-pyproj')
optdepends=('python-shapely: coverage feature support'
            'python-gdal: OGR datasource support'
            'python-lxml: more advanced WMS FeatureInformation support')
  cd $srcdir/mapproxy-${pkgver}
  python setup.py install --root=$pkgdir/ 
}

package_python2-mapproxy() {
depends=('python2' 'python2-pillow' 'python2-yaml' 'python2-pyproj')
optdepends=('python2-shapely: coverage feature support'
            'python2-gdal: OGR datasource support'
            'python2-lxml: more advanced WMS FeatureInformation support')
  cd $srcdir/mapproxy2-${pkgver}
  python2 setup.py install --root=$pkgdir/  
}
