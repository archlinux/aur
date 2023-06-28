# Maintainer: Lorenzo Gaifas <brisvag at gmail dot com>
# Contributor: Abdur-Rahman Mansoor <mansoorar at proton dot me>

_name='pytomlpp'
_author='bobfang1992'
_framework='python'
pkgname="${_framework}-${_name}"
pkgver=1.0.13
pkgrel=1
pkgdesc='A python wrapper for toml++.'
arch=('any')
url="https://github.com/${_author}/${_name}"
license=('BSD')
makedepends=(
  'python-setuptools-scm'
  'tomlplusplus'
)
depends=(
  'python'
  'pybind11'
)
source=("$_name-$pkgver.tar.gz::https://github.com/$_author/$_name/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('785fe23907ec9c8c3f172603ed9c68480f4da9a0eb3c9ed63f45e66303a2dba4')

provides=("${_framework}-${_name}")

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  sed -i 's/<tomlplusplus\/include\/toml++\/toml.h>/<toml++\/toml.h>/' ./include/pytomlpp/pytomlpp.hpp
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim:set ts=2 sw=2 et:<Paste>
