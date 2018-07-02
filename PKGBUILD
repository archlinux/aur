# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=gitlint
pkgver=0.10.0
pkgrel=1
pkgdesc='Git commit message linter'
arch=('any')
depends=('python-arrow' 'python-click' 'python-setuptools' 'python-sh')
url='https://jorisroovers.github.io/gitlint/'
license=('MIT')
options=(!emptydirs)
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/jorisroovers/$pkgname/tar.gz/v$pkgver)
sha256sums=('045e6817c8f9efc1cfa30b0e78572fd7e06c64be30c94e0b9cf0d19fa999abce')

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
