# Maintainer: Jelle van der Waa <jelle@archlinux.org>

pkgname=python-trimesh
pkgver=3.9.31
pkgrel=3
pkgdesc='Trimesh is a pure Python library for loading and using triangular meshes with an emphasis on watertight surfaces'
arch=('any')
url="https://github.com/mikedh/trimesh"
license=('MIT')
depends=(python python-numpy)
makedepends=(python-setuptools)
checkdepends=(python-scipy python-networkx python-rtree python-lxml
              python-shapely python-pillow python-sympy python-requests
              python-msgpack python-pyglet python-jsonschema
              python-svg.path python-collada)
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
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/mikedh/trimesh/archive/${pkgver}.tar.gz)
sha512sums=('869154628e399b336a8a028b0c3b7bf0a950384e957503ba662badf8d109e330daebbda617ff240cae4c07e2d88c4e07c0115637259d17c0c30890e940e04251')

build() {
  cd trimesh-${pkgver}
  python setup.py build
}

check() {
  cd trimesh-${pkgver}
  python -m unittest discover tests
}

package() {
  cd trimesh-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

  install -D -m644 LICENSE.md "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
