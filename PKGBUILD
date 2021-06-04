# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=pipgrip
pkgver=0.6.10
pkgrel=1
pkgdesc="Lightweight pip dependency resolver with deptree preview functionality based on the PubGrub algorithm"
arch=('any')
url="https://github.com/ddelange/pipgrip"
license=('BSD')
depends=('python-anytree' 'python-click' 'python-packaging' 'python-pkginfo'
         'python-setuptools' 'python-wheel' 'python-pip')
makedepends=('python-setuptools-scm')
source=("https://pypi.org/packages/source/${pkgname:0:1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('775b82aa6fc33b31bfadb483946172c235285d019f0577ab40fde219a7ff977d')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	export PYTHONHASHSEED=0
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build

	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
