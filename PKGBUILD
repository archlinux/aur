# Maintainer: Philipp A. <flying-sheep@web.de>
_name=numcodecs
pkgname=python-numcodecs
pkgver=0.16.2
pkgrel=1
pkgdesc='A Python package providing buffer compression and transformation codecs for use in data storage and communication applications'
arch=(x86_64)
url="https://github.com/zarr-developers/$_name"
license=(MIT)
depends=(python-numpy python-typing_extensions)
makedepends=(cython python-py-cpuinfo python-setuptools python-setuptools-scm python-build python-installer python-wheel)
optdepends=(python-msgpack python-zfpy python-pcodec python-crc32c)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('9922dae0c3b01b5bed3b4bae239f4787e891daa3262c27971298669d029d10e9')

build() {
	cd "$_name-$pkgver"
	# https://github.com/Blosc/c-blosc/issues/393
	export CFLAGS="$CFLAGS -march=native -std=gnu17"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}
