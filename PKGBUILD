pkgname=python-nyaapy
_name=NyaaPy
pkgver=0.7.0
pkgrel=1
pkgdesc="Unofficial Python wrapper for Nyaa anime torrent sites"
url="https://github.com/JuanjoSalvador/NyaaPy"
depends=('python>=3.10' 'python-requests' 'python-lxml' 'python-beautifulsoup4')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
license=('MIT')
arch=('any')
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3b0de0f6adf8b0ebe9c1da254a8c8f243ceb698b069693c9b8404c483695ae1b')

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

check() {
	cd "$_name-$pkgver"
	python -m pytest tests
}

package() {
	cd "${_name}-${pkgver}"
	python setup.py install --optimize=1 --root="$pkgdir/"
	install -Dm644 LICENSE.md -t "$pkgdir"/usr/share/licenses/$pkgname/
}
