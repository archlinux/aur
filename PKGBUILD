# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>

pkgbase=python-pyfuse3
pkgname=(python-pyfuse3)
pkgver=3.2.2
pkgrel=1
arch=('x86_64')
pkgdesc="Python 3 bindings for libfuse 3 with asynchronous API (Trio compatible)"
url="https://github.com/libfuse/pyfuse3"
license=('LGPL')
depends=('python' 'python-trio' 'fuse3')
makedepends=('python-setuptools')
source=("https://github.com/libfuse/pyfuse3/releases/download/${pkgver}/pyfuse3-${pkgver}.tar.gz"{,.asc})
sha256sums=('aa4080913e6148bff1365d4aaacdc96767b87a1e178031fd9caeb5f0b9fc8cec'
            'SKIP')
validpgpkeys=('ED31791B2C5C1613AF388B8AD113FCAC3C4E599F'
              '6D5BEF9ADD2075805747B70F9F88FB52FAF7B393')

prepare() {
	cd pyfuse3-$pkgver
	#rm MANIFEST.in  # disable developer mode
}

build() {
	cd pyfuse3-$pkgver
	#python setup.py build_cython
	python setup.py build_ext --inplace
	python setup.py build
}

package_python-pyfuse3() {
	cd pyfuse3-$pkgver
	python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
