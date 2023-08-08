# Maintainer: a821
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=python-tinyrecord
pkgver=0.2.1.r6.g96223e9
_commit=96223e9f472ef3353aa3c4a63d1e46501edd8452
pkgrel=1
pkgdesc="Atomic transactions for TinyDB"
arch=('any')
url="https://github.com/eugene-eeo/tinyrecord"
license=('MIT')
depends=('python-tinydb')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'git')
checkdepends=('python-pytest')
source=("$pkgname::git+$url#commit=$_commit")
sha256sums=('SKIP')

build() {
	cd "$pkgname"
	python -m build --wheel --no-isolation
}

check() {
	cd "$pkgname"
	pytest -x tests.py
}

package() {
	cd "$pkgname"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
