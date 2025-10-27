# Previous Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Nicolas Pouillard <nicolas.pouillard@gmail.com>
# Contributor: Peter Simons <simons@cryp.to>
# Contributor: SecByShresth <shresthpaul133@gmail.com>

pkgbase=zfec
pkgname=python-zfec
pkgver=1.6.0.0
pkgrel=1
pkgdesc="Fast erasure coding tool"
arch=('x86_64')
url='https://github.com/tahoe-lafs/zfec'
license=('GPL')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/z/zfec/zfec-$pkgver.tar.gz")
sha256sums=('c5a1861c253b512698c2e733ae4d83f5e2d6ea6c881b7dbe11334b694e755a00')

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
