# Maintainer: Jonas Witschel <diabonas@archlinux.org>
pkgname=python-tpm2-pytss
_name=${pkgname#python-}
pkgver=0.1.8
pkgrel=2
pkgdesc='Python bindings for tpm2-tss'
arch=('x86_64')
url='https://github.com/tpm2-software/tpm2-pytss'
license=('BSD')
depends=('python' 'python-setuptools' 'tpm2-tss' 'libtss2-esys.so'
         'libtss2-fapi.so' 'libtss2-rc.so' 'libtss2-esys.so' 'libtss2-tctildr.so')
makedepends=('swig')
checkdepends=('ibm-sw-tpm2' 'python-cryptography')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('a0a1c492d4d0ac4855c4f3b7bbf1c9d63d96aa9be06da800d1d44800b319bc54')

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
