# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-pyttsx3
pkgver=2.91
pkgrel=4
pkgdesc="Offline text-to-speech synthesis"
arch=('any')
url="https://github.com/nateshmbhat/pyttsx3"
license=('MPL2')
depends=('python')
optdepends=('espeak')
makedepends=('python-setuptools' 'python-sphinx')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('d001a057042370a5d2c30dcaa8945bf35fc6d782aad55b8f5edc67ace5217493')

build() {
	cd "python-pyttsx3-v.$pkgver"
	python setup.py build
	cd docs
	make man
}

package() {
	cd "pyttsx3-v.$pkgver"
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dm 644 docs/_build/man/pyttsx3.1 -t "$pkgdir/usr/share/man/man1/"
}
