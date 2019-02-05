# Maintainer: Colin Unger <mastkata3 at yahoo dot com>

pkgname=python-itanium_demangler-git
pkgdesc="A python project to provide easy distributed data storage"
url="https://github.com/whitequark/python-itanium_demangler"
pkgver=1.0.r8.29c7786
pkgrel=1
arch=('any')
depends=('python')
makedepends=('git' 'python-setuptools')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
license=('BSD')
source=("$pkgname::git+https://github.com/whitequark/python-itanium_demangler.git#branch=master")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	rev_num="$(git rev-list --count HEAD)"
	version_no="$(grep -oP 'version="\K([0-9\.]+)' < setup.py)"
	last_commit="$(git rev-parse --short HEAD)"
	echo "$version_no.r$rev_num.$last_commit"
}

build() {
	cd "$srcdir/$pkgname"
	python setup.py build
}

package() {
	cd "$srcdir/$pkgname"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE-0BSD.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
