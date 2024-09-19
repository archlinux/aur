# Maintainer: Jesse R Codling < codling at umich dot edu >
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
pkgname=python-zlib-ng
pkgver=0.5.0
pkgrel=1
pkgdesc="A drop-in replacement for Python's zlib and gzip modules using zlib-ng"
arch=(any)
url="https://github.com/pycompression/${pkgname}"
license=('PSF-2.0')
depends=('python' 'zlib-ng')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel' 'python-versioningit')
checkdepends=('python-tox' 'python-tests' 'python-pip')
source=("git+${url}#tag=v${pkgver}")
sha256sums=('70751541978c07cd8454ae530672788cfbffa0c53ee452cbf54e2d78760f5ec8')

export PYTHON_ZLIB_NG_LINK_DYNAMIC=1

build() {
	cd "$pkgname"
	python -m build --wheel --no-isolation
}

check() {
	cd "$pkgname"
	tox
}

package() {
	cd "$pkgname"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

