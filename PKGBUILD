# Maintainer: Tobias Frisch <thejackimonster@gmail.com>

pkgname=python-pep-adapter-hg
_name=pEpPythonAdapter
pkgver=2.1.0
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

	hg up "Release_2.1.0"

	sed -i 's/\-mt//g' setup.py
}

pkgver() {
	cd "$srcdir/${_name}"
	
	hg tags | grep Release | grep -v RC | sort -r | head -1 | awk '{print $1}' | cut -c9-
}

build() {
	cd "$srcdir/${_name}"

	python3 setup.py build_ext
}

package() {
	cd "$srcdir/${_name}"

	python3 setup.py install --root="$pkgdir" --optimize=1
}
