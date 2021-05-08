# Contributor: Andy Weidenbaum <archbaum@gmail.com>
pkgname=gitlint
pkgver=0.15.1
pkgrel=1
pkgdesc='Git commit message linter'
arch=('any')
depends=('python-arrow' 'python-click' 'python-setuptools' 'python-sh')
url='https://jorisroovers.github.io/gitlint/'
license=('MIT')
options=(!emptydirs)
source=($pkgname-$pkgver.tar.gz::https://github.com/jorisroovers/gitlint/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('adb8dcc6be95035142f197d599bffecdaba3e56e83547491888d1f2b5827054a')

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
