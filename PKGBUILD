# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: mdraw.gh at gmail dot com

pkgname=python-markovify
pkgver=0.9.3
pkgrel=1
pkgdesc="Simple, extensible Markov chain generator"
arch=('any')
url='https://github.com/jsvine/markovify'
license=('MIT')
depends=('python-unidecode')
makedepends=('python-setuptools')
checkdepends=('python-nose')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('37388aa9fb066bc8f0c5490691500ce5df05fd6e629c24fca3f9eed2cd26245e')

build() {
	cd "markovify-$pkgver"
	python setup.py build
}

check() {
	cd "markovify-$pkgver"
	nosetests
}

package() {
	cd "markovify-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --root="${pkgdir}" --prefix=/usr --optimize=1 --skip-build
	install -Dm 644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
