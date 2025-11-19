# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_pkg=newspaper4k
pkgname=python-${_pkg}
pkgdesc='A fork and continuation of the newspaper3k/newspaper package.'
pkgver=0.9.4.1
pkgrel=1
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
b2sums=('9e0aa228cb8c29e41c41b90b0bda90f2f51b7c6e3ddec572b60d7fb1a7a734d6c0f313f9bc277fda9bbb5ebb1794efa0147c65bbdc63cff73e45fb03fe36ee41')

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
