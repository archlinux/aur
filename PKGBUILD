# Maintainer: Otreblan <otreblain@gmail.com>

pkgname=cmake-language-server
pkgver=0.1.2
pkgrel=1
pkgdesc="Python based cmake language server"
arch=('any')
url="https://github.com/regen100/cmake-language-server"
license=('MIT')
groups=()
depends=("python-pygls" "python-pyparsing" "cmake")
makedepends=("python-setuptools")
optdepends=()
provides=()
conflicts=("cmake-format")
replaces=()
backup=()
options=()
install=
changelog=
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
noextract=()
sha256sums=('a0b8cc43555a06b7964359c80dd35c8cfcbcdea1b2213b2e64378d5ea721c100')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"

	sed \
		-e "s/from distutils.core import setup/from setuptools import setup/" \
		-e "s/pygls>=0.8.1,<0.9.0/pygls>=0.8.1/" \
		-i setup.py
}

build() {
	cd "$srcdir/$pkgname-$pkgver"

	python setup.py build
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
