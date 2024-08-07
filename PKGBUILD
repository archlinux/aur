# Maintainer:
# Contributor: Polarian <polarian@polarian.dev>
# Contributor: Utsav <aur (a) utsav2 [.] dev>

_module="glean_parser"
_pkgname="python-${_module//_/-}"
pkgname="$_pkgname"
pkgver=14.5.1
pkgrel=1
pkgdesc="Tools for parsing the metadata for Mozilla's glean telemetry SDK"
url="https://github.com/mozilla/glean_parser"
license=('MPL-2.0')
arch=('any')

depends=(
  'python'
  'python-appdirs'
  'python-click'
  'python-diskcache' # AUR
  'python-jinja'
  'python-jsonschema'
  'python-yaml'
)
makedepends=(
  'python-build'
  'python-installer'
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
  '1b4d6007004dde8439cafa1b68b88962b8638cb7e78a7563498b972ec260d435'
)

build() {
  cd "$_pkgsrc"
  python -m build --wheel --no-isolation --skip-dependency-check
}

check() {
  cd "$_pkgsrc"
  PYTHONPATH=./ pytest
}

package() {
  cd "$_pkgsrc"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
