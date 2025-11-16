# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_pkg=newspaper4k
pkgname=python-${_pkg}
pkgdesc='A fork and continuation of the newspaper3k/newspaper package.'
pkgver=0.9.4
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
b2sums=('a132c76b9c88042e654bf40823ffcc100252bdb94965fe1d2d9d400567914cc7169e5fd1ab7d57eac2713ef860c39bc665fc91ca114cc278ca3d809bac581217')

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
