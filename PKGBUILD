# Maintainer: Lorenzo Gaifas <brisvag at gmail dot com>

_name='in-n-out'
_name_slug="${_name//-/_}"
_author='pyapp-kit'
pkgname="python-${_name}"
pkgver=0.1.9
pkgrel=2
pkgdesc='Python dependency injection you can taste.'
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
)
source=("https://files.pythonhosted.org/packages/source/${_name_slug::1}/${_name_slug}/${_name_slug}-${pkgver}.tar.gz")
sha256sums=('89feb944e420faf42d3c2542145681b4d57144355932c2b859695fcdc4f9a2da')

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
