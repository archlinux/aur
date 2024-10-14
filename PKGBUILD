# Maintainer: Ethan Skinner <aur@etskinner.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-pyttsx3
pkgver=2.98
pkgrel=1
pkgdesc="Offline text-to-speech synthesis"
arch=('any')
url="https://github.com/nateshmbhat/pyttsx3"
license=('MPL2')
depends=('python')
optdepends=('espeak')
makedepends=('python-setuptools' 'python-sphinx')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('d9746a4b8e87f72138cd4a98e7e416b1fb87b73ee456e5b7956565cc195a0107')

build() {
	cd "pyttsx3-$pkgver"
	python setup.py build
	cd docs
	make man
}

package() {
	cd "pyttsx3-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dm 644 docs/_build/man/pyttsx3.1 -t "$pkgdir/usr/share/man/man1/"
}
