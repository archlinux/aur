# Contributor: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: xantares

_pypi_name=pytablewriter
_name=${_pypi_name,,}

pkgname=python-${_name,,}
pkgver=1.2.1
pkgrel=1
pkgdesc='Python library to write a table in various formats'
arch=('any')
url="https://github.com/thombashi/${_pypi_name}"
license=('MIT')
makedepends=(
  'git'
  'python-setuptools'
  'python-build'
  'python-installer'
  'python-wheel'
  'python-sphinx'
  'python-sphinx_rtd_theme')
depends=(
  'python'
  'python-markdown'
  'python-mbstrdecoder'
  'python-pypandoc'
  'python-path'
  'python-requests'
  'python-loguru'
  'python-typepy'
  'python-jsonschema'
  'python-oauth2client'
  'python-simplejson'
  'python-tabledata'
  'python-beautifulsoup4'
  'python-xlrd'
  'python-pathvalidate'
  'python-dataproperty'
  'python-pytablereader')

source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-${pkgver}.tar.gz")
sha256sums=('7bd0f4f397e070e3b8a34edcf1b9257ccbb18305493d8350a5dbc9957fced959')
validpgpkeys=('BCF9203E5E80B5607EAE6FDD98CDA9A5F0BFC367')

build() {
  cd "${_name}-$pkgver"

  python -m build --wheel --no-isolation

  rst2man README.rst "$pkgname.7"
}

package() {
  cd "${_name}-$pkgver"

  export PYTHONHASHSEED=0
  python -m installer --destdir="$pkgdir/" dist/*.whl

  install -Dm644 "$pkgname.7" -t "$pkgdir/usr/share/man/man7/"

  local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  ln -s \
    "$_site/${_name}-${pkgver}.dist-info/licenses/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/"
}

# vim: ts=2 sw=2 et:
