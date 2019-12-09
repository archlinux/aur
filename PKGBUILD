# Maintainer: Otreblan <otreblain@gmail.com>

pkgname=cmake-language-server
pkgver=0.1.0
pkgrel=3
pkgdesc="Python based cmake language server"
arch=('any')
url="https://github.com/regen100/cmake-language-server"
license=('MIT')
groups=()
depends=("python-pygls" "python-pyparsing" "cmake")
makedepends=("python-setuptools")
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
noextract=()
sha256sums=("82ba3920f80f2d3fb1210f7122dfc6b92d773d4c0079555b4475909557c9be22")

prepare() {
	cd $pkgname-$pkgver

	sed -i "s/from distutils.core import setup/from setuptools import setup/" setup.py
}

build() {
	cd "$pkgname-$pkgver"

	python setup.py build
}

package() {
	cd "$pkgname-$pkgver"

	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
