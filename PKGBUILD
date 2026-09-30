# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=python-wayback-archive
pkgver=1.4.6
pkgrel=1
pkgdesc="Download and archive complete websites from the Wayback Machine for offline viewing"
arch=('any')
url="https://github.com/GeiserX/Wayback-Archive"
license=('GPL-3.0-only')
depends=('python' 'python-requests' 'python-beautifulsoup4' 'python-lxml' 'python-dotenv')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
checkdepends=('python-pytest' 'python-pillow')
optdepends=('python-pillow: image optimisation' 'python-minify-html: HTML minification (AUR)' 'python-rjsmin: JavaScript minification' 'python-cssmin: CSS minification')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4fcd1bb3bff8430d7bd7c3b88a33f63e12dabf9e72d6338463a12d386142def9')

build() {
	cd "Wayback-Archive-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "Wayback-Archive-$pkgver"
	python -m pytest tests -v
}

package() {
	cd "Wayback-Archive-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
