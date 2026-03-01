# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_pkg=newspaper4k
pkgname=python-${_pkg}
pkgdesc='A fork and continuation of the newspaper3k/newspaper package.'
pkgver=0.9.5
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
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'python-poetry' 'python-hatchling')
optdepends=('python-numpy' 'python-pandas' 'python-tinysegmenter' 'python-pythainlp' 'python-jieba' 'python-indic-nlp-library' 'python-cloudscraper' 'python-gnews')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('77c97a7d527b995b04f51e46c6753c83ab70c0c7e08e6907d8e66db25bb2c07c4720a5002bf1d8f8a36dcb8406f82a5cb8307edae93d1f0bc26cf2131b6e74e3')

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
