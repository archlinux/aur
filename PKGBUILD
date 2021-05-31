# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
pkgname=buildstream-git
pkgver=1.93.6.r47.gc388631bb
pkgrel=1
pkgdesc="Framework for modelling build pipelines in a declarative YAML format"
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
makedepends=(python-setuptools cython git)
provides=('buildstream')
conflicts=('buildstream')
source=("git+https://github.com/apache/buildstream.git")
md5sums=('SKIP')

pkgver() {
  cd buildstream
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd buildstream
  python setup.py build
}

package() {
  cd buildstream
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
