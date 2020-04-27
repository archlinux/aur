# Maintainer: Otreblan <otreblain@gmail.com>

pkgname=cmake-language-server
pkgver=0.1.1
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
conflicts=("cmake-format")
replaces=()
backup=()
options=()
install=
changelog=
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
noextract=()
sha256sums=("3d96b3715c3cb48a35eda2b3a08e4e923f9e9c24fa05a4bbaf40c3dc954174f0")

prepare() {
	cd $pkgname-$pkgver

	sed -i "s/from distutils.core import setup/from setuptools import setup/" setup.py
	sed -i "s/pygls>=0.8.1,<0.9.0/pygls>=0.8.1/" setup.py
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
