# Maintainer: Tobias Frisch <thejackimonster@gmail.com>

pkgname=python-pep-adapter-hg
_name=pEpPythonAdapter
pkgver=1.0
pkgrel=1
pkgdesc="p≡p Python adapter"
url="https://pep.foundation/dev/repos/pEpPythonAdapter"
depends=('python' 'pep-engine' 'boost' 'boost-libs' 'gcc')
makedepends=('mercurial' 'python')
optdepends=()
license=('GPL3')
arch=('any')
source=("hg+https://pep.foundation/dev/repos/${_name}")
sha256sums=('SKIP')
provides=('python-pep-adapter')

prepare() {
	cd "$srcdir/${_name}"

	sed -i 's/\-mt//g' setup.py
}

pkgver() {
	cd "$srcdir/${_name}"
	
	awk "/^\\s*version='[0-9\.]+',$/ "'{print $1}' setup.py | cut -c10- | rev | cut -c3- | rev
}

build() {
	cd "$srcdir/${_name}"

	python3 setup.py build_ext
}

package() {
	cd "$srcdir/${_name}"

	python3 setup.py install --root="$pkgdir" --optimize=1
}
