# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=gitlint
pkgver=0.13.1
pkgrel=1
pkgdesc='Git commit message linter'
arch=('any')
depends=('python-arrow' 'python-click' 'python-setuptools' 'python-sh')
url='https://jorisroovers.github.io/gitlint/'
license=('MIT')
options=(!emptydirs)
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/jorisroovers/$pkgname/tar.gz/v$pkgver)
sha256sums=('9df58f47d0b30e59828a7a26c904a943a6072b155d2157dd83863e19ff8625ae')

prepare() {
	cd $pkgname-$pkgver

	msg2 'Loosening PyPi dependency restrictions...'
	sed -i -e 's/\(sh\|Click\|arrow\)==/\1>=/' requirements.txt setup.py
}

build() {
	cd $pkgname-$pkgver

	python setup.py build
}

package() {
	cd $pkgname-$pkgver

	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
