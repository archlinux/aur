# Maintainer: Aseem Athale <athaleaseem@gmail.com>
# Contributor: Philip Goto <philip.goto@gmail.com>

_pkgname=srsly
pkgname=python-${_pkgname}
pkgver=2.5.0
pkgrel=1
pkgdesc='Modern high-performance serialization utilities for Python'
arch=(x86_64 aarch64)
url='https://github.com/explosion/srsly'
license=('MIT')
depends=('cython' 'python-catalogue' 'python-pytz' 'python-numpy' 'python-psutil')
checkdepends=('python-pytest' 'python-pytest-timeout' 'python-mock')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz"::${url}/archive/refs/tags/release-v${pkgver}.tar.gz)
b2sums=('0d4f47e93f6a086681bca6c8f64a05f8991bbcd812befc67a5b078ae19d6bf9b63d8d8af4303f217b175294bcb4ac138f22fe9f3daa75502d9cdff94877d4619')

build() {
	cd "${_pkgname}-release-v${pkgver}"
	python -m build --wheel --no-isolation
}

#check() {
#	cd "${_pkgname}-release-v${pkgver}"
#  python -m installer -d tmp_install dist/*.whl
#  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
#  PYTHONPATH="$PWD/tmp_install/$site_packages" python -m pytest -v --pyargs srsly
#}

package() {
	cd "${_pkgname}-release-v${pkgver}"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
