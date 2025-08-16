# Maintainer: Chris Oelmueller <chris.oelmueller@gmail.com>
# Contributor: Han Xiao <arak.hx@gmail.com>
pkgname=python-gvgen
_name=${pkgname#python-}
pkgver=1.0
pkgrel=2
pkgdesc='Generates dot language files for easy scripting, to be processed with graphviz.'
arch=('any')
url='https://github.com/stricaud/gvgen'
license=('MIT')
depends=('python')
makedepends=(python-build python-installer python-wheel)
source=("https://github.com/stricaud/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
sha1sums=('f3a774e6a0d09f82b31efba736ba5dc4ab9b07aa')
sha256sums=('47510a6eb70a7a435bdcdf56e58b08a6bf3c8adf42e4ae5430d9fb9b7760872b')
sha512sums=('007ce806733379120f229bf82509a84968e3613a207edf3e42a0af7fb2749c7e1b7f66a75abd5e907a5972adcbff2a7d4a3e058fc5fc33fc91534203e8b2d4f2')

PYTHON='python'

build() {
  cd "${_name}-${pkgver}"
  $PYTHON -m build --wheel --no-isolation
}

package() {
  cd "${_name}-${pkgver}"
  $PYTHON -m installer --destdir="${pkgdir}" dist/*.whl
  install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

