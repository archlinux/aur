# Maintainer: Alex Hirzel <alex at hirzel period us>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Butui Hu <hot123tea123@gmail.com>

pkgname=python-jsonargparse
_name=${pkgname#python-}
pkgver=4.22.1
pkgrel=1
pkgdesc='Parsing library for CLI options, configs, and environment variables'
arch=('any')
url='https://github.com/omni-us/jsonargparse'
license=('MIT')
depends=('python-yaml')
makedepends=('python-argcomplete' 'python-attrs' 'python-fsspec' 'python-jsonschema' 'python-pydantic' 'python-pytorch' 'python-requests' 'python-responses')
checkdepends=('python-coverage' 'python-pytest')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('32339056285fcc931ad7f2095233160df1b50f348bb30694574539930727155f')
sha256sums=('be0acc4f9fd1953f774668152c17165abba122038aeb2ac61ec145b770a9e096')

#prepare() {
#  cd "$_name-$pkgver"
#  sed -i '2c\packages = jsonargparse' setup.cfg
#}

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/${_name}-${pkgver}"
  PYTHONPATH="$PWD" python -m unittest discover
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir" dist/*.whl
  local _site=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  ln -s "$_site/$_name-$pkgver.dist-info/LICENSE.rst" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
