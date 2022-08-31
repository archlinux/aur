# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Nicolas Pouillard <nicolas.pouillard@gmail.com>
# Contributor: Peter Simons <simons@cryp.to>

pkgbase=zfec
pkgname=python-zfec
pkgver=1.5.7.2
pkgrel=2
pkgdesc="Fast erasure coding tool"
arch=('x86_64')
url='https://github.com/tahoe-lafs/zfec'
license=('GPL')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/z/zfec/zfec-$pkgver.tar.gz")
sha256sums=('4ee519be0dcc7da2e88482bcfc0bf977a425e1d7e8278cf5bbbb8d00f8a2afb6')

prepare() {
	cd "zfec-$pkgver"
	# deleting SOURCES.txt and excluding tests isn't good enough
	rm -rf zfec/test
}

build() {
	cd "zfec-$pkgver"
	python -m build --wheel --no-isolation
}

package_python-zfec() {
	cd "zfec-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir" dist/*.whl
}
