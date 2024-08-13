# Contributor: Henry-Joseph Audéoud <h.audeoud@gmail.com>
# Contributor: getzze <getzze at gmail dot com>
_base=rise
pkgname=jupyter-nbextension-${_base}
pkgver=5.7.1
pkgrel=2
pkgdesc="Live Reveal.js Jupyter/IPython Slideshow Extension"
arch=(any)
url="https://github.com/damianavila/RISE"
license=(BSD-3-Clause)
depends=(jupyter-notebook)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('df750daf98043d86e270deeefe03bdca9f5794710be634c9f2eae11f015d0ffffefac1951eb3a2849cd542d7b72a560555b4256567dac82f256efbca3c402591')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
  # No need to call `jupyter nbextension install rise`, it is handled in setup.py
  # however, change the path from /usr/etc to /etc
  mv "${pkgdir}/"{usr/etc,etc}
}
