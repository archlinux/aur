# Maintainer: Philipp A. <flying-sheep@web.de>
_name=numcodecs
pkgname=python-numcodecs
pkgver=0.15.1
pkgrel=1
pkgdesc='A Python package providing buffer compression and transformation codecs for use in data storage and communication applications'
arch=(x86_64)
url="https://github.com/zarr-developers/$_name"
license=(MIT)
depends=(python-numpy python-deprecated)
makedepends=(cython python-py-cpuinfo python-setuptools python-setuptools-scm python-build python-installer python-wheel)
optdepends=(python-msgpack python-zfpy python-pcodec python-crc32c)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('eeed77e4d6636641a2cc605fbc6078c7a8f2cc40f3dfa2b3f61e52e6091b04ff')

build() {
	cd "$_name-$pkgver"
	export CFLAGS="$CFLAGS -march=native"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}
