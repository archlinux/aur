# Maintainer: Fabrix Xm <fabrix.xm@gmail.com>
_pkgname=lesana
pkgname=lesana-git
pkgver=v0.9.1.r18.g744139f
pkgrel=1
pkgdesc="Manage collection inventories throught yaml files, develop version"
arch=('any')
url="https://lesana.trueelena.org/"
license=(GPL3)
depends=('python-dateutil' 'python-jinja' 'python-ruamel-yaml' 'python-xapian' 'python-setuptools' 'python-hazwaz')
optdepends=('python-argcomplete: enable commandline tab completion' 'python-gitpython: git integration') 
makedepends=('git' 'python-setuptools')
provides=(lesana)
conflicts=(lesana)
source=("git+https://git.sr.ht/~valhalla/lesana")
md5sums=(SKIP)

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${_pkgname}"
  sed -i.bpk "s/find_packages()/find_packages(exclude=['tests',])/" setup.py
}

build() {
  cd "${_pkgname}"
  python setup.py build
}

package() {
  cd "${_pkgname}"
  python setup.py install --skip-build --root="${pkgdir}" --optimize=1
}
