# Maintainer:
# Contributor: Polarian <polarian@polarian.dev>
# Contributor: Utsav <aur (a) utsav2 [.] dev>

_module="glean_parser"
_pkgname="python-${_module//_/-}"
pkgname="$_pkgname"
pkgver=12.0.1
pkgrel=1
pkgdesc="Tools for parsing the metadata for Mozilla's glean telemetry SDK"
url="https://github.com/mozilla/glean_parser"
license=('MPL-2.0')
arch=('any')

depends=(
  'python'
  'python-appdirs'
  'python-click'
  'python-diskcache'
  'python-jinja'
  'python-jsonschema'
  'python-markupsafe'
  'python-setuptools'
  'python-yaml'
)

makedepends=(
  'python-build'
  'python-installer'
  'python-pytest-runner'
  'python-setuptools-scm'
  'python-wheel'
)
checkdepends=(
  'python-pytest'
)

provides=("python-$_module=${pkgver}")
conflicts=("python-$_module")

_pkgsrc="$_module-$pkgver"
_pkgext="tar.gz"
_dl_url="https://files.pythonhosted.org/packages/source"
source=(
  "$_pkgsrc.$_pkgext"::"$_dl_url/${_module::1}/$_module/$_pkgsrc.$_pkgext"
)
sha256sums=(
  'df5ecc457356a48cad0911b2c55292dfc75becccd691d4fd2bba4a3b746b607a'
)

build() {
  cd "$_pkgsrc"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_pkgsrc"
  PYTHONPATH=./ pytest
}

package() {
  cd "$_pkgsrc"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
