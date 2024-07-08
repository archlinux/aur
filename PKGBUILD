# Contributor Anthony25 <Anthony Ruhier>
#
# Thanks to Jeremy "Ichimonji10" Audet <ichimonji10 at gmail dot com> for
# his PKGBUILD that served as a base for this one

pkgname=python2-graphviz
# Do NOT update. 0.17 dropped support for Python 2
pkgver=0.16
pkgrel=2
pkgdesc='Simple Python 2 interface for Graphviz (Legacy Python 2 version)'
arch=(any)
url='https://github.com/xflr6/graphviz'
license=(MIT)
depends=('graphviz')
makedepends=('python2' 'python2-setuptools')
checkdepends=('python2-mock' 'python2-pytest' 'python2-pytest-mock')
options=(!emptydirs)
source=("https://github.com/xflr6/graphviz/archive/${pkgver}.tar.gz")
sha256sums=('11db94f18583d2953dee77de48c34d8f8a7941052f2350aee08d73cbd32febcd')

prepare() {
  cd "graphviz-${pkgver}"

  # do not run python-coverage in unittests :/
  sed -i 's/--cov --cov-report=term --cov-report=html//' setup.cfg
}

build(){
  cd "graphviz-${pkgver}"

  python2 setup.py build
}

check() {
    cd "graphviz-${pkgver}"
    python2 run-tests.py
}

package() {
  cd "graphviz-${pkgver}"

  python2 setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
  install -Dm644 LICENSE.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE.txt
}
