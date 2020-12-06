# Maintainer: Johannes Holland <joh.ho@gmx.de>
pkgname=python-tpm2-gui-git
_name=${pkgname#python-}
pkgver=0.0.1.r1.2ea1ef7
pkgrel=1
pkgdesc='GUI for the TPM Software Stack (TSS) Feature API (FAPI)'
arch=('any')
url='https://github.com/joholl/tpm2-gui'
license=('BSD')
depends=('python' 'gtk3' 'gobject-introspection-runtime' 'gdk-pixbuf2' 'pango'
         'json-c' 'python-tpm2-pytss-git' 'python-gobject'
		 'python-cryptography')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=('tpm2-gui-git')
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
	cd "${_name%-git}"
	python -B setup.py test
}

package() {
	cd "${_name%-git}"
	python setup.py install --root="$pkgdir" --optimize=1
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

