# Maintainer: Lorenzo Gaifas <brisvag at gmail dot com>

_name='pyconify'
_name_slug="${_name//-/_}"
_author='pyapp-kit'
pkgname="python-${_name}"
pkgver=0.1.6
pkgrel=1
pkgdesc='Python wrapper for the Iconify API.'
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
  'python-requests'
)
source=("https://files.pythonhosted.org/packages/source/${_name_slug::1}/${_name_slug}/${_name_slug}-${pkgver}.tar.gz")
sha256sums=('25272f7a29965f32ee698c9da6aab8bbbeb0756ca3bfeadd3d9effab689d239d')

build() {
  cd "${srcdir}/${_name_slug}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_name_slug}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim:set ts=2 sw=2 et:<Paste>
