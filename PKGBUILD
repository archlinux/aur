# Maintainer: Maximilian Stahlberg <maximilian.stahlberg tu-berlin de>

pkgname=python-concurrencytest
pkgver=0.1.2.4
_commit=c807f3e1428ff91ad93f270306966bc6597f3adf
pkgrel=1
pkgdesc='Python testtools extension for running unittest suites concurrently.'
arch=('any')
url='https://github.com/cgoldberg/concurrencytest'
license=('GPL3')
depends=('python-testtools' 'python-subunit')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://github.com/cgoldberg/concurrencytest/archive/${_commit}.zip"
        "fix_warnings.patch")
md5sums=('223e5dd7a97d95a464de3a06c4734aba'
         '26a55216936cd4c7970d0ced04bc9c47')

prepare() {
	cd "${srcdir}/concurrencytest-${_commit}"
	patch --forward --strip=1 --input="${srcdir}/fix_warnings.patch"
}

build() {
	cd "${srcdir}/concurrencytest-${_commit}"
	python -m build --wheel --no-isolation
}

check() {
	cd "${srcdir}/concurrencytest-${_commit}/build/lib"
	python -Bc "import concurrencytest"
}

package() {
	cd "${srcdir}/concurrencytest-${_commit}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
}
