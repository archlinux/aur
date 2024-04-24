# Maintainer: Fabrix Xm <fabrix.xm@gmail.com>
_pkgname=lesana
pkgname=lesana-git
pkgver=v0.10.0.r0.g1dd720e
pkgrel=1
pkgdesc="Manage collection inventories throught yaml files, develop version"
arch=('any')
url="https://lesana.trueelena.org/"
license=(AGPL-3.0-or-later)
depends=('python' 'python-dateutil' 'python-jinja' 'python-ruamel-yaml' 'python-xapian' 'python-setuptools' 'python-hazwaz')
optdepends=(
    'python-argcomplete: enable commandline tab completion'
    'git: git integration'
    'sh: git integration'
    'python-gitpython: git integration'
    'python-requests: openlibrary integration'
) 
makedepends=(git python-build python-installer python-wheel python-setuptools-scm)
provides=(lesana=${pkgver})
conflicts=(lesana)
source=("git+https://git.sr.ht/~valhalla/lesana")
md5sums=(SKIP)

pkgver() {
  cd "${_pkgname}"
  git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${_pkgname}"
  git clean -dfx
}

build() {
  cd "${_pkgname}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm0755 scripts/lesana ${pkgdir}/usr/bin/lesana
  install -Dm0755 scripts/openlibrary2lesana ${pkgdir}/usr/bin/openlibrary2lesana
  install -Dm0755 scripts/tellico2lesana ${pkgdir}/usr/bin/tellico2lesana
}
