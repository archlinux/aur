# Maintainer: Aseem Athale <athaleaseem@gmail.com>
# Contributor: Philip Goto <philip.goto@gmail.com>

_pkgname=srsly
pkgname=python-${_pkgname}
pkgver=2.5.1
pkgrel=1
pkgdesc='Modern high-performance serialization utilities for Python'
arch=(x86_64 aarch64)
url='https://github.com/explosion/srsly'
license=('MIT')
depends=('cython' 'python-catalogue' 'python-pytz' 'python-numpy' 'python-psutil')
checkdepends=('python-pytest' 'python-pytest-timeout' 'python-mock')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz"::${url}/archive/refs/tags/release-v${pkgver}.tar.gz)
b2sums=('6c255c91048579b4bb3815a059c954e5f7a0ed151b7d72525f5f012a14a3d74a87f6b9dd9e9b63c8a19db6bf3542117df8a606672b4be6d7b6a247637120e7cf')

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
