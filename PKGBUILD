# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=python-td-cli
pkgver=1.3.0
pkgrel=1
pkgdesc="A command line todo manager where you can organize and manage your todos across multiple projects"
arch=('any')
url="https://github.com/darrikonn/td-cli"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v.$pkgver.tar.gz")
sha256sums=('1d55ec0671e81706fc7170a86cb74f4b13a96c22fdaf9c5fd31dbcfaef20f10b')

prepare() {
	cd "td-cli-v.$pkgver"
	sed -i 's/>=3.6\.\*, <4/>=3.6, <4/' setup.py
}

build() {
	cd "td-cli-v.$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "td-cli-v.$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
