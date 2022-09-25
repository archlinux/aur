# Maintainer: Brad Pitcher <bradpitcher@gmail.com>
# Contributor: Jelle van der Waa <jelle@archlinux.org>

pkgname=python-trimesh
pkgver=3.15.2
pkgrel=1
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
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('9ae3917f2485f5eba089fd04029187be356bbb032d8afa57801a5c19a897550a34bd6734848a47c937b42745fd4563a5a05352928f5e31a7146a3b002d6c765d')

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
