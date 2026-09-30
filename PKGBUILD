# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=python-deadcode
pkgver=0.1.1
pkgrel=1
pkgdesc="Detect and auto-remove unused exports, dead routes and orphaned CSS in TS/React/Next.js projects"
arch=('any')
url="https://github.com/Coding-Dev-Tools/deadcode"
license=('MIT')
depends=('python' 'python-click' 'python-rich' 'python-pathspec' 'python-yaml')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('52cc212289b607760dbac702508e5a583d0d4ff2f5705f9f08e0d949264d068d')

build() {
	cd "deadcode-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "deadcode-$pkgver"
	python -m pytest tests -v
}

package() {
	cd "deadcode-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
