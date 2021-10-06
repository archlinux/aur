# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-pyttsx3
pkgver=2.90
pkgrel=1
pkgdesc="Offline text-to-speech synthesis"
arch=('any')
url="https://github.com/nateshmbhat/pyttsx3"
license=('MPL2')
depends=('python' 'espeak')
makedepends=('python-setuptools' 'python-sphinx')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v.$pkgver.tar.gz")
sha256sums=('e47cc9a5d4288d6634fa676f36a581c8d5657f15b86de4dcc45a63e12fa31b27')

build() {
	cd "pyttsx3-v.$pkgver"
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
