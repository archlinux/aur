# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>
# Contributor: Richard Tucker <rtucker@mookins.com>

pkgname=python-statemachine
provides=('python-statemachine')
pkgdesc="Python finite-state machines made easy"
url="https://github.com/fgmacedo/$pkgname"
pkgver=2.4.0
pkgrel=1
arch=('any')
license=('MIT')
depends=('python' 'python-pydot')
makedepends=('python-setuptools')

source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('fc51668efee69a2a59c5f3a5bbb08e6a6647a819175bbd02305e6eac51d0f8ef31c4e89f85dcb7451c24681ee76f0534e676995e134c0cbbed4d680c5418c612')

_archive="python-statemachine-$pkgver"

build() {
	cd "$_archive"

	python -m build --wheel --no-isolation
}

check() {
	pytest \
		--deselect $_archive/tests/test_contrib_diagram.py::TestQuickChart \
		--deselect $_archive/tests/test_mock_compatibility.py::test_minimal \
		--deselect $_archive/tests/test_profiling.py::test_setup_performance \
		--deselect $_archive/tests/test_profiling.py::test_event_performance \
		--deselect $_archive/tests/test_statemachine.py::test_machine_should_activate_initial_state
}

package() {
	cd "$_archive"

	python -m installer --destdir="$pkgdir" dist/*.whl

	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
