# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
pkgname=buildstream-devel
pkgver=1.93.6
pkgrel=1
pkgdesc="A powerful and flexible software integration toolset"
arch=('x86_64')
url="https://buildstream.build"
license=('LGPL')
depends=(
    bubblewrap
    buildbox-casd
    python-click
    python-dateutil
    python-grpcio
    python-jinja
    python-pluginbase
    python-protobuf
    python-psutil
    python-pyroaring
    python-ruamel-yaml
    python-ujson
    # specific host site dependencies
    git lzip
)

makedepends=(python-setuptools cython)
provides=('buildstream')
conflicts=('buildstream')
source=("$pkgname-$pkgver.tar.gz::https://github.com/apache/buildstream/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('377876c169162227c087ebde4f8543c556b894f37d9bc3d8cb23b2d3db707f47')

build() {
  cd buildstream-$pkgver
  python setup.py build
}

package() {
  cd buildstream-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
