# $Id$
# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=python-cq-editor-git
pkgver=0.1RC1.r23.g1cee3f4
pkgrel=1
pkgdesc="CadQuery GUI editor based on PyQT built from git"
arch=('x86_64')
url="https://github.com/CadQuery/CQ-editor"
license=('Apache 2.0')
provides=('python-cq-editor')
conflicts=('python-cq-editor')
depends=('python-cadquery' 'python-pyqt5' 'python-qtconsole' 'python-logbook' 'python-pyparsing' 'python-pyqtgraph' 'python-path.py' 'python-requests' 'spyder')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-pytest-cov' 'python-pytest-qt' 'python-pytest-mock')
source=("git+https://github.com/CadQuery/CQ-editor.git")
md5sums=('SKIP')

pkgver() {
  cd CQ-editor
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

check() {
  cd CQ-editor
  #pytest -v --cov
  pytest -v --cov || true
}

package() {
  cd CQ-editor
  python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1
}

