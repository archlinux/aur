# Contributor: redponike <proton (dot) me>
# Contributor: Alex Hirzel <alex at hirzel period us>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Butui Hu <hot123tea123@gmail.com>
# Contributor: tee < teeaur at duck dot com >

pkgname=python-jsonargparse
_pkgname=${pkgname#python-}
pkgver=4.53.0
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
b2sums=('87ccb9bf6438a3cc4e9f1c3f570ed551e59b269ba3a0301c248fe281ac13fe0317f7e6d4cfb37e1d57eaaab91aeea23898349527d022c8c5d31e678950ac31da')

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
