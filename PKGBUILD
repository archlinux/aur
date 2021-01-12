# $Id$
# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=python-cq-editor-git
pkgver=0.1.2.r48.g2f75bf6
pkgrel=1
pkgdesc="CadQuery GUI editor based on PyQT built from git"
arch=('x86_64')
url="https://github.com/CadQuery/CQ-editor"
license=('Apache')
provides=('python-cq-editor')
conflicts=('python-cq-editor')
depends=(
python-cadquery
python-pyqt5
python-qtconsole
python-logbook
python-pyparsing
python-pyqtgraph
python-path.py
python-requests
spyder
python-scipy
python-nptyping)
makedepends=('python-setuptools')
checkdepends=(
python-pytest
python-pytest-qt
python-pytest-mock
)
source=("git+https://github.com/CadQuery/CQ-editor.git")
md5sums=('SKIP')

pkgver() {
  cd CQ-editor
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd CQ-editor
  #curl https://github.com/greyltc/CQ-editor/commit/d3a0899bca7a16e4fd87ba01c69a7bf22afa7a1f.patch | patch -p1  # for https://github.com/CadQuery/CQ-editor/issues/176
  #curl https://github.com/greyltc/CQ-editor/commit/dc2734d19b826ab90df6db58fbceb6b6a6ed2229.patch | patch -p1  # for https://github.com/CadQuery/CQ-editor/issues/174 and 122
}

check() {
  cd CQ-editor
  #pytest -v --cov
  pytest || :
}

package() {
  cd CQ-editor
  python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1
}

