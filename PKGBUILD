# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
pkgname=buildstream-git
pkgver=1.3.0+2948+g05136ead
pkgrel=1
pkgdesc="Framework for modelling build pipelines in a declarative YAML format"
arch=('any')
url="https://buildstream.build"
license=('LGPL')
depends=(
    bubblewrap
    python-click
    python-grpcio
    python-jinja
    python-pluginbase
    python-protobuf
    python-psutil
    python-pyroaring
    python-ruamel-yaml
    python-ujson
    # specific host site dependencies
    bzr git lzip python-arpy
)
makedepends=(python-setuptools cython git)
provides=('buildstream')
conflicts=('buildstream')
source=("git+https://gitlab.com/BuildStream/buildstream.git")
md5sums=('SKIP')

pkgver() {
  cd buildstream
  git describe --tags | sed 's/-/+/g'
}

build() {
  cd buildstream
  python setup.py build
}

package() {
  cd buildstream
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
