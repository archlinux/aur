# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>

_project=ots-python
_pyname=opentype-sanitizer
pkgname=python-$_pyname
pkgver=8.1.4.post3
pkgrel=2
pkgdesc='Python wheels for the OpenType Sanitizer'
arch=(any)
url="https://github.com/googlefonts/$_project"
license=(GPL3)
depends=(ots
         python)
checkdepends=(python-pytest
              woff2)
makedepends=(python-setuptools-scm)
_archive="$_pyname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.tar.gz"
        system-ots-sanitize.patch)
sha256sums=('112efdd99915781e4fb79e165832dacf61c0335db4738fd9043b960a8c9f8d91'
            '6388d57e44f3dc7d6ee91422b30ca9eca3e3c590bacaa7bc4664b6183ed4d065')

prepare () {
	cd "$_archive"
	patch -p0 < "../system-ots-sanitize.patch"
}

build() {
	cd "$_archive"
	python setup.py build
}

check() {
	cd "$_archive"
	PYTHONPATH=src/python pytest
}

package() {
	cd "$_archive"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
