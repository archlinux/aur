# Maintainer: Fabrix Xm <fabrix.xm@gmail.com>
pkgname=lesana
pkgver=0.10.0
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
makedepends=(python-build python-installer python-wheel)
source=("https://git.sr.ht/~valhalla/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('5ca8edabe894f6d48f182920fd2ea44eba89d7bd2f2e8bbc1bfdfa04c9afd841')

prepare() {
    cd "${pkgname}-v${pkgver}"
    rm -fr dist/*.whl
}

build() {
  cd "${pkgname}-v${pkgver}"
  python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
  cd "${pkgname}-v${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm0755 scripts/lesana ${pkgdir}/usr/bin/lesana
  install -Dm0755 scripts/openlibrary2lesana ${pkgdir}/usr/bin/openlibrary2lesana
  install -Dm0755 scripts/tellico2lesana ${pkgdir}/usr/bin/tellico2lesana
}
