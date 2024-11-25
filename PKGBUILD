# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>

_name="sphinx-typlog-theme"
pkgname="python-${_name}"
pkgver=0.8.0
pkgrel=8
pkgdesc="A sphinx theme by Typlog"
arch=('any')
url="https://github.com/typlog/${_name}"
license=('BSD-3-Clause')
depends=('python' 'python-docutils' 'python-sphinx')
makedepends=('python-build' 'python-installer' 'python-setuptools')
_pkgsrc="${_name}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('ee5bd9677554aac3f93106458d3a02f17fa99f211f7b760530e3ada6cd01864f')

build() {
  cd "${srcdir}/${_pkgsrc}"
  python -m build --wheel --no-isolation
}

package() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd "${srcdir}/${_pkgsrc}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -vDm644 "README.rst" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -vd "${pkgdir}/usr/share/licenses/${pkgname}"
  cd "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -vs "${site_packages}/${_name//-/_}-${pkgver}.dist-info/LICENSE" "LICENSE"
}

# vim:set ts=2 sw=2 et:
