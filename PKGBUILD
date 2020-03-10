# Maintainer: Jonas Witschel <diabonas@archlinux.org>
pkgname=python-tpm2-pytss
_name=${pkgname#python-}
pkgver=0.0.5
pkgrel=1
pkgdesc='Python bindings for tpm2-tss'
arch=('x86_64')
url='https://github.com/tpm2-software/tpm2-pytss'
license=('BSD')
depends=('python-setuptools' 'tpm2-tss')
makedepends=('swig')
checkdepends=('ibm-sw-tpm2')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('ab32ef147a963a56d6c6b60414b55ff86a6853c24ca5692e145bbea7ae5cc218')

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

check() {
	cd "$_name-$pkgver"
	python setup.py test
}

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
	rm -r "$pkgdir"/usr/lib/python*/site-packages/tests
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
