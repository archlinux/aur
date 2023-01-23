# Maintainer: Lorenzo Gaifas <brisvag at gmail dot com>

_name='app-model'
_author='pyapp-kit'
pkgname="python-${_name}"
pkgver=0.1.1
pkgrel=1
pkgdesc='Generic application schema implemented in python.'
arch=('any')
url="https://github.com/${_author}/${_name}"
license=('BSD')
makedepends=(
  'python-setuptools-scm'
  'python-build'
  'python-installer'
)
depends=(
  'python'
  'python-in-n-out'
  'python-psygnal'
  'python-pydantic'
  'python-typing_extensions'
)
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('40830455cb66441001ae25978698842eacf16e6ce1be7d737a0eaaad063de562')
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
