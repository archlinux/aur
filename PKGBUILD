# Maintainer: Polarian <polarian@polarian.dev>
# Contributor: Utsav <aur (a) utsav2 [.] dev>

pkgname=python-glean-parser
_name=glean_parser
pkgver=9.0.0
pkgrel=1
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
sha256sums=('77004a76cf3d09a6a7640e1be48eaed35436b36de3a10a7948e0a37535e7fd77')
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
