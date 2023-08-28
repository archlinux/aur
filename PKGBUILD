# Maintainer: Polarian <polarian@polarian.dev>
# Contributor: Utsav <aur (a) utsav2 [.] dev>

pkgname=python-glean-parser
_name=${pkgname#python-}
pkgver=7.2.1
pkgrel=3
pkgdesc="Tools for parsing the metadata for Mozilla's glean telemetry SDK"
arch=('any')
url="https://github.com/mozilla/glean_parser"
license=('MPL2')
depends=('python' 'python-appdirs' 'python-click' 'python-diskcache' 'python-iso8601'
         'python-jinja' 'python-jsonschema' 'python-markupsafe' 'python-yaml')
makedepends=('python-build' 'python-installer' 'python-pytest-runner'
             'python-setuptools-scm' 'python-wheel')
checkdepends=('python-pytest')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('11496ac004fe421b914c7fbdc9a1d620e4821d56e1d9f65523d3858cdb907bbd')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_name-$pkgver"
  PYTHONPATH=./ pytest
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
