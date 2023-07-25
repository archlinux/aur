# Maintainer: Lorenzo Gaifas <brisvag at gmail dot com>

_name='psygnal'
_author='pyapp-kit'
pkgname="python-${_name}"
pkgver=0.9.1
pkgrel=1
pkgdesc='Fast python callback/event system modeled after Qt Signals'
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
  'python-mypy_extensions'
  'python-typing_extensions'
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('a42cd3e55c474673cc8f61e7cdb40fb647ca94868a1d262bf4b6d6aa2fc8bf27')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim:set ts=2 sw=2 et:<Paste>
