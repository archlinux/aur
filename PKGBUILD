# Maintainer: Alex Hirzel <alex at hirzel period us>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Butui Hu <hot123tea123@gmail.com>

pkgname=python-jsonargparse
_name=${pkgname#python-}
pkgver=4.32.1
pkgrel=1
pkgdesc='Parsing library for CLI options, configs, and environment variables'
arch=('any')
url='https://github.com/omni-us/jsonargparse'
license=('MIT')
depends=(
  'python'
  'python-argcomplete'
  'python-attrs'
  'python-docstring-parser'
  'python-fsspec'
  'python-jsonschema'
  'python-pydantic'
  'python-pytest'
  'python-pytorch'
  'python-requests'
  'python-responses'
  'python-ruyaml'
  'python-shtab'
  )
optdepends=(
  'python-omegaconf'
  'python-jsonnet'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
)
checkdepends=(
  'python-coverage'
  )
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('17e66ec1ab6529907dd38cbf26d740e2fb5a8e52782739c76d5659247b43cda5')

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
