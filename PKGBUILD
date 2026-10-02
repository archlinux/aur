# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=python-saws
pkgver=0.4.2
pkgrel=1
pkgdesc="A supercharged AWS command line interface (CLI)"
arch=('any')
url="https://github.com/donnemartin/saws"
license=('Apache-2.0')
depends=('python' 'aws-cli' 'python-click' 'python-configobj' 'python-prompt_toolkit' 'python-pygments' 'python-six')
makedepends=('python-build' 'python-installer' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('052b37e73feeea24fb59afcb0bc50119a801533f069535a3dade236517968fe8')

build() {
	cd "saws-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "saws-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	rm -rf "$pkgdir"/usr/lib/python*/site-packages/tests
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
