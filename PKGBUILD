# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Jelle van der Waa <jelle@archlinux.org>

pkgname=python-newspaper
_pkg=newspaper3k
pkgdesc='Article scraping & curation'
pkgver=0.2.8
pkgrel=4
url="https://github.com/codelucas/newspaper"
arch=('any')
license=('BSD')
depends=(
	'python-beautifulsoup4'
	'python-cssselect'
	## MISSING python-feedfinder2'
	'python-feedparser'
	'python-jieba'
	'python-lxml'
	'python-nltk'
	## MISSING python-pythainlp'
	'python-pillow'
	'python-dateutil'
	'python-yaml'
	'python-requests'
	## MISSING python-tinysegmenter==0.3
	'python-tldextract')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkg::1}/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('9f1bd3e1fb48f400c715abf875cc7b0a67b7ddcd87f50c9aeeb8fcbbbd9004fb')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s "$_site/$_pkg-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
