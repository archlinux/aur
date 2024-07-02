# Maintainer: Jesse R Codling < codling at umich dot edu >
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
pkgname=python-zlib-ng
pkgver=0.4.3
pkgrel=1
pkgdesc="A drop-in replacement for Python's zlib and gzip modules using zlib-ng"
arch=(any)
url="https://github.com/pycompression/${pkgname}"
license=('PSF-2.0')
depends=('python' 'zlib-ng')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-tox' 'python-tests' 'python-pip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('6c17baa462950bc9b032eee69a498108c4a7693002e7400a0f78f9e02eb87343')

export PYTHON_ZLIB_NG_LINK_DYNAMIC=1

build() {
	cd "$pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "$pkgname-$pkgver"
	tox
}

package() {
	cd "$pkgname-$pkgver"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

