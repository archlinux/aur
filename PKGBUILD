# Maintainer: Alex Hirzel <alex at hirzel period us>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Butui Hu <hot123tea123@gmail.com>

pkgname=python-jsonargparse
_name=${pkgname#python-}
pkgver=4.36.0
pkgrel=1
pkgdesc='Parsing library for CLI options, configs, and environment variables'
arch=('any')
url='https://github.com/omni-us/jsonargparse'
license=('MIT')
depends=(
  'python-fsspec'
  'python-responses'
  'python-yaml'
  )
optdepends=(
  'python-argcomplete'
  'python-docstring-parser'
  'python-jsonnet'
  'python-jsonschema'
  'python-omegaconf'
  'python-pydantic'
  # reconplogger
  'python-requests'
  'python-ruyaml'
  'python-shtab'
  'python-toml'
  #'python-typeshed-client'
  'python-typing_extensions'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
)
checkdepends=(
  'python-attrs'
  'python-coverage'
  'python-pytest'
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('95b9a5df843d0224acae1a9bb780745fa8f206784a87b2b30d5b1db11b00c125')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

#check() {
#  cd "${srcdir}/${_name}-${pkgver}"
#  PYTHONPATH="$PWD" python -m unittest discover
#}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir" dist/*.whl
  local _site=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  ln -s "$_site/$_name-$pkgver.dist-info/LICENSE.rst" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
