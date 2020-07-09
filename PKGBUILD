# Maintainer: Jonas Witschel <diabonas@archlinux.org>
pkgname=python-tpm2-pytss
_name=${pkgname#python-}
pkgver=0.1.7
pkgrel=1
pkgdesc='Python bindings for tpm2-tss'
arch=('x86_64')
url='https://github.com/tpm2-software/tpm2-pytss'
license=('BSD')
depends=('python-setuptools' 'tpm2-tss')
makedepends=('swig')
checkdepends=('ibm-sw-tpm2' 'python-cryptography')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('3791eb148736dc704fa379fb6b45c5964f7b0953a37f867eab7fa4ffe1a51076')

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
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
