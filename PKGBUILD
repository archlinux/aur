# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
pkgname=buildstream-git
pkgver=1.3.0+1528+g174f5394
pkgrel=1
pkgdesc="Framework for modelling build pipelines in a declarative YAML format"
arch=('any')
url="https://wiki.gnome.org/Projects/BuildStream/"
license=('LGPL')
depends=(bubblewrap ostree python-click python-jinja
         python-gobject python-grpcio python-pluginbase
         python-protobuf python-psutil python-pyroaring
         python-ruamel-yaml0.15.51 python-ujson
         # specific host site dependencies
         bzr git lzip python-arpy)
makedepends=(python-setuptools git)
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
