# Maintainer:
# Contributor: Polarian <polarian@polarian.dev>
# Contributor: Utsav <aur (a) utsav2 [.] dev>

_module="glean_parser"
_pkgname="python-${_module//_/-}"
pkgname="$_pkgname"
pkgver=11.0.1
pkgrel=1
pkgdesc="Tools for parsing the metadata for Mozilla's glean telemetry SDK"
url="https://github.com/mozilla/glean_parser"
license=('MPL2')
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
  '79e523b51b0fddce9f6c6309fa8c64328bb706b2d6c847a53f88a93d01695e43'
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
