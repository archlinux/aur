# Maintainer: Brad Pitcher <bradpitcher@gmail.com>
# Contributor: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Jelle van der Waa <jelle@archlinux.org>

_base=trimesh
pkgname=python-${_base}
pkgver=3.21.5
pkgrel=1
pkgdesc='Python library for loading and using triangular meshes.'
arch=('any')
url="https://trimsh.org"
license=('MIT')
depends=(python python-numpy)
makedepends=(python-setuptools)
checkdepends=(python-scipy python-networkx python-rtree python-lxml
              python-shapely python-pillow python-sympy python-requests
              python-msgpack python-pyglet python-jsonschema
              python-svg.path python-collada python-pyinstrument
              python-mapbox-earcut openscad)
optdepends=('python-networkx: graph operations'
            'python-pyglet: preview windows'
            'python-rtree: vector path handling'
            'python-scipy: convex hulls'
            'python-shapely: vector path handling'
            'python-pillow: load images'
            'python-jsonschema: validate JSON schemas like GLTF'
            'python-requests: network requests'
            'python-msgpack: serialize into msgpack'
            'python-lxml: handle XML better and faster than built- in XML'
            'python-sympy: do analytical math'
            'python-svg.path: handle SVG format path strings'
            'python-xxhash: hash ndarrays faster than built-in MD5/CRC'
            'python-collada: parse collada/dae/zae files')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/mikedh/${_base}/archive/${pkgver}.tar.gz)
sha512sums=('4bf6879294042aea9bce65a79c1717de1bec92a0a9f6f420ed98dbc4cb5260dba4656ee0074f77d46d37c910838c7a4b7c7dff0249aa38109bb677993f886291')

build() {
  cd ${_base}-${pkgver}
  python setup.py build
}

check() {
  cd ${_base}-${pkgver}
  python -m unittest discover tests
}

package() {
  cd ${_base}-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

  install -D -m644 LICENSE.md "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
