# Maintainer: Marcus Hoffmann <bubu@bubu1.eu>

_pkgname=crispy-bootstrap3
pkgname=python-crispy-bootstrap3
pkgver=2022.1
pkgrel=1
pkgdesc="Bootstrap3 template pack for django-crispy-forms"
arch=('any')
url="https://github.com/django-crispy-forms/crispy-bootstrap3"
license=('MIT')
	depends=('python' 'python-django' 'python-django-crispy-forms')
checkdepends=('python-pytest' 'python-coverage' 'python-pytest-django' 'python-pytest-cov')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('f62729ed06976caf7fd5fd4fe009c0a702b0705db7765c2b486ba96c64341146')

check() {
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  cd ${_pkgname}-${pkgver}
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="test_dir/$_site_packages:$PYTHONPATH"
  pytest -vv
}

build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}-${pkgver}"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
