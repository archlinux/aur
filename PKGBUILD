# Maintainer: Polarian <polarian@polarian.dev>
# Contributor: Utsav <aur (a) utsav2 [.] dev>

pkgname=python-glean-parser
_name=glean_parser
pkgver=10.0.1
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
sha256sums=('ea80410958e59a47ad5421fa8b30ab8afd82aaf0103ff4c2ecb31a333ff97fa3')
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
