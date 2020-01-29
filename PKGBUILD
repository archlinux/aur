# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=python-yolk3k
_name=${pkgname#python-}
pkgver=0.9
pkgrel=1
pkgdesc="Command-line tool for querying PyPI and Python packages installed on your system
         (with Python 3 support)"
arch=('any')
url="https://github.com/myint/yolk"
license=('BSD-3-Clause')
depends=('python')
makedepends=('python-setuptools')
#checkdepends=('python-pycodestyle' 'rstcheck')
optdepends=('python-paste' 'rstcheck')
provides=("${pkgname%3k}")
conflicts=("${pkgname%3k}")
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('cf8731dd0a9f7ef50b5dc253fe0174383e3fed295a653672aa918c059eef86ae')

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

#check() {
#	cd "$_name-$pkgver"
#	pycodestyle --ignore=E402 yolk setup.py
#	python setup.py --long-description | rstcheck -
#	check-manifest
#	./check_readme.bash
#}

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build

	install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname"
}
