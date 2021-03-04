# Maintainer: Jonas Witschel <diabonas@archlinux.org>
pkgname=python-tpm2-pytss-git
_name=${pkgname#python-}
pkgver=0.1.9.r44.0f25670
pkgrel=1
pkgdesc='Python bindings for tpm2-tss'
arch=('x86_64')
url='https://github.com/tpm2-software/tpm2-pytss'
license=('BSD')
depends=('python' 'python-cffi' 'tpm2-tss' 'libtss2-esys.so')
makedepends=('git' 'python-setuptools' 'python-setuptools-scm' 'python-toml')
checkdepends=('ibm-sw-tpm2')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=('tpm2-pytss-git')
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
	cd "${_name%-git}"
	git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
	cd "${_name%-git}"
	python setup.py build
}

check() {
	cd "${_name%-git}"/build/lib.*
	python -B -m unittest
}

package() {
	cd "${_name%-git}"
	python setup.py install --root="$pkgdir" --optimize=1
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
