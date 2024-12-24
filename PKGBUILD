# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_pkg=newspaper4k
pkgname=python-${_pkg}
pkgdesc='A fork and continuation of the newspaper3k/newspaper package.'
pkgver=0.9.3.1
pkgrel=4
url="https://github.com/andythefactory/newspaper4k"
arch=('any')
license=('MIT')
depends=(
	'python-beautifulsoup4'
	'python-feedparser'
	'python-lxml'
	'python-nltk'
	'python-pillow'
	'python-dateutil'
	'python-yaml'
	'python-requests'
	'python-tldextract'
	'python-typing_extensions')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'python-poetry')
optdepends=('python-numpy' 'python-pandas' 'python-tinysegmenter' 'python-pythainlp' 'python-jieba' 'python-indic-nlp-library' 'python-cloudscraper' 'python-gnews')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('879febfcf14c313487805009cc2bf8d509928ae8f89c723937e25d40bbfb8283')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkg-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
