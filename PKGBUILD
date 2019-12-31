# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=gitlint
pkgver=0.12.0
pkgrel=1
pkgdesc='Git commit message linter'
arch=('any')
depends=('python-arrow' 'python-click' 'python-setuptools' 'python-sh')
url='https://jorisroovers.github.io/gitlint/'
license=('MIT')
options=(!emptydirs)
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/jorisroovers/$pkgname/tar.gz/v$pkgver)
sha256sums=('a56c90a52f503da773e120831934b0285fe86c8158c1a72665e27dcf3ab6b38f')

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
