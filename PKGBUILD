# Maintainer: Polarian <polarian@polarian.dev>
# Contributor: Utsav <aur (a) utsav2 [.] dev>

pkgname=python-glean-parser
_name=glean_parser
pkgver=8.1.1
pkgrel=2
pkgdesc="Tools for parsing the metadata for Mozilla's glean telemetry SDK"
arch=('any')
url="https://github.com/mozilla/glean_parser"
license=('MPL2')
depends=('python' 'python-appdirs' 'python-click' 'python-diskcache'
         'python-jinja' 'python-jsonschema' 'python-markupsafe' 'python-yaml'
         'python-setuptools')
makedepends=('python-build' 'python-installer' 'python-pytest-runner'
             'python-setuptools-scm' 'python-wheel')
checkdepends=('python-pytest')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('6d49e0c0aac34a1e9eda7fc63b12f1513efed1c827e0ac94078493114049021e')
# Rename of package to be more conventional
provides=("python-glean_parser")
conflicts=("python-glean_parser")

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
