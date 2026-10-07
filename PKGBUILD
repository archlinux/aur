# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=python-wayback-archive
pkgver=1.5.0
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
sha256sums=('b63f17af72af21659a7a0c74099c15e66550caded6cecaa455b4f3adde9388be')

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
