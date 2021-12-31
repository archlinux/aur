# Maintainer: Fabrix Xm <fabrix.xm@gmail.com>
pkgname=lesana
pkgver=0.9.1
pkgrel=2
pkgdesc="Manage collection inventories throught yaml files"
arch=('any')
url="https://lesana.trueelena.org/"
license=(GPL3)
depends=('python-dateutil' 'python-jinja' 'python-ruamel-yaml' 'python-xapian' 'python-gitpython')
optdepends=('python-argcomplete: support for bash autocompletion')
makedepends=('python-setuptools')
provides=(lesana)
source=("https://git.sr.ht/~valhalla/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('f0d166c71c5f9baa03b1815bd0d27d7a')

prepare() {
  cd "${pkgname}-v${pkgver}"
  # exclude tests from package
  sed -i.bpk "s/find_packages()/find_packages(exclude=['tests',])/" setup.py
}

build() {
  cd "${pkgname}-v${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-v${pkgver}"
  python setup.py install --skip-build --root="${pkgdir}" --optimize=1
  install scripts/openlibrary2lesana "${pkgdir}/usr/bin/"
  install scripts/tellico2lesana "${pkgdir}/usr/bin/"
}
