# Maintainer: Maximilian Stahlberg <maximilian.stahlberg tu-berlin de>

pkgname=python-concurrencytest
pkgver=0.1.2.22
_commit=c91cd62f45985abe907d86839dcb858db60f1419
pkgrel=1
pkgdesc='Python testtools extension for running unittest suites concurrently.'
arch=('any')
url='https://github.com/cgoldberg/concurrencytest'
license=('GPL-2.0-or-later')
depends=('python-testtools' 'python-subunit')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://github.com/cgoldberg/concurrencytest/archive/${_commit}.zip")
sha256sums=('9006e37e28af9751a7f0883dcfec0cf3ba2a18a17c8c6f205bb7842fe69dcdf2')

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
