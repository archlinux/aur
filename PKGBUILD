# Maintainer: Colin Unger <mastakata3 at yahoo dot com>

pkgname=python-idalink-git
pkgdesc="Remote use of the IDA (the Interactive DisAssembler) Python API"
url="https://github.com/zardus/idalink"
pkgver=0.12.r82.cf68144
pkgrel=1
arch=('any')
depends=('python' 'python-rpyc')
makedepends=('git' 'python-setuptools')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
license=('BSD')
source=("$pkgname::git+https://github.com/zardus/idalink.git#branch=master")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	rev_num="$(git rev-list --count HEAD)"
	version_no="$(grep -oP "version='\\K([0-9\\.]+)" < setup.py)"
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
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
