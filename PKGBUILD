# Maintainer: Repentinus <aur at repentinus dot eu>

# The authors hereby explictly waive all copyright and related or neighbouring
# rights to this work using the CC0
# <https://creativecommons.org/publicdomain/zero/1.0/>.

pkgname='python-typed-argument-parser'
_name=${pkgname#python-}
pkgver=1.9.0
pkgrel=1
pkgdesc="Typed modernization of Python's argparse library"
arch=('any')
url='https://github.com/swansonk14/typed-argument-parser'
license=('MIT')
depends=('python-typing_extensions' 'python-typing_inspect' 'python-docstring-parser')
makedepends=('python-setuptools')
checkdepends=('python-pytest-runner' 'python-pip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/swansonk14/$_name/archive/refs/tags/v_$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
	cd "$_name-v_$pkgver"
	python setup.py build
}

package() {
	cd "$_name-v_$pkgver"
	export PYTHONHASHSEED=0
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

check() {
	cd "$srcdir/$_name-v_$pkgver"
	python setup.py pytest --addopts "-k 'not GitTests'"
}
