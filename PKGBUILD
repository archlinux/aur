# Maintainer: Fabrix Xm <fabrix.xm@gmail.com>
pkgname=lesana
pkgver=0.8.1
pkgrel=1
pkgdesc="Manage collection inventories throught yaml files"
arch=('x86_64' 'aarch64')
url="https://lesana.trueelena.org/"
license=(GPL3)
depends=('python-dateutil' 'python-jinja' 'python-ruamel-yaml' 'python-xapian' 'python-gitpython')
makedepends=('python-setuptools')
provides=(lesana)
source=("https://git.sr.ht/~valhalla/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('01661874bca5fb478850f46189b46f19')

prepare() {
  cd "${pkgname}-v${pkgver}"
  sed -i.bpk "s/find_packages()/find_packages(exclude=['tests',])/" setup.py
}

build() {
  cd "${pkgname}-v${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-v${pkgver}"
  python setup.py install --skip-build --root="${pkgdir}" --optimize=1
}
