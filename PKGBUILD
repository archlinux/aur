# Contributor: redponike <proton (dot) me>
# Contributor: Alex Hirzel <alex at hirzel period us>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Butui Hu <hot123tea123@gmail.com>
# Contributor: tee < teeaur at duck dot com >

pkgname=python-jsonargparse
_pkgname=${pkgname#python-}
pkgver=4.52.0
pkgrel=1
pkgdesc='Parsing library for CLI options, configs, and environment variables'
arch=('any')
url='https://github.com/omni-us/jsonargparse'
license=('MIT')
depends=('python-yaml')
optdepends=(
  'python-docstring-parser'
  'python-fsspec'
  'python-jsonschema'
  'python-omegaconf'
  'python-ruyaml'
  'python-toml'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
)
checkdepends=(
  'python-pytest'
  'python-pytest-subtests'
  'python-attrs'
  'python-argcomplete'
  'python-pydantic'
  'python-requests'
  'python-shtab'
  'python-responses'
)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
b2sums=('81932599b738bc01dd778417362311a69fd8ef23b927b8e864e3781b9ab6cd02df21f4ed9351aa64cd895f97b9e64079bdefc7543c1a76006ae3a9ba5166ebc1')

build() {
  python -m build --wheel --no-isolation "${_pkgname}-${pkgver}"
}

check() {
  cd "${_pkgname}-${pkgver}"
#  PYTHONPATH="jsonargparse_tests" pytest -vv
}

package() {
  cd "${_pkgname}-${pkgver}"
  PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir" dist/*.whl
  local _site=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  ln -s "$_site/$_pkgname-$pkgver.dist-info/LICENSE.rst" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
