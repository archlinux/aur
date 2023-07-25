# Maintainer: Lorenzo Gaifas <brisvag at gmail dot com>

_name='app-model'
_name_slug="${_name//-/_}"
_author='pyapp-kit'
pkgname="python-${_name}"
pkgver=0.2.0
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
source=("https://files.pythonhosted.org/packages/source/${_name_slug::1}/${_name_slug}/${_name_slug}-${pkgver}.tar.gz")
sha256sums=('d2c95406d7002f2a38aed19eb233ffe884401a44cf19c37a2e96593c46518818')

build() {
  cd "${srcdir}/${_name_slug}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_name_slug}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim:set ts=2 sw=2 et:<Paste>
