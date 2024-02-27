# Maintainer: Lorenzo Gaifas <brisvag at gmail dot com>

_name='app-model'
_name_slug="${_name//-/_}"
_author='pyapp-kit'
pkgname="python-${_name}"
pkgver=0.2.4
pkgrel=1
pkgdesc='Generic application schema implemented in python.'
arch=('any')
url="https://github.com/${_author}/${_name}"
license=('BSD')
makedepends=(
  'python-build'
  'python-hatch-vcs'
  'python-hatchling'
  'python-installer'
)
depends=(
  'python'
  'python-in-n-out'
  'python-psygnal'
  'python-pydantic'
  'python-pydantic-compat'
  'python-typing_extensions'
)
source=("https://files.pythonhosted.org/packages/source/${_name_slug::1}/${_name_slug}/${_name_slug}-${pkgver}.tar.gz")
sha256sums=('127cda637003a34b26371c9c68ae5b24d7012682f071a10657a94900c8cd439d')

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
