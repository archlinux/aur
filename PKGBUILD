# Maintainer: Lorenzo Gaifas <brisvag at gmail dot com>

_name='in-n-out'
_author='pyapp-kit'
pkgname="python-${_name}"
pkgver=0.1.6
pkgrel=1
pkgdesc='Python dependency injection you can taste.'
arch=('any')
url="https://github.com/${_author}/${_name}"
license=('BSD')
makedepends=(
  'python-setuptools-scm'
  'python-build'
  'python-installer'
  'cython3'
)
depends=(
  'python'
)
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('3eece389d39130556598565b9a7bbd3bdd85a22b97ac2f0d351ca3c1da1dae26')
provides=("python-${_name}")

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim:set ts=2 sw=2 et:<Paste>
