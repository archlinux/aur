# Maintainer: coldbug <coldBug@e.mail.de>
_pkgbase=python-netfilterqueue
pkgname=python-netfilterqueue-git
pkgver=r100.0bb948d
pkgrel=1
pkgdesc="Python 3.x for libnetfilter_queue."
arch=('any')
url="https://github.com/kti/python-netfilterqueue"
license=("GPL2")
depends=('python' 'cython' 'libnetfilter_queue')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("${_pkgbase}::git+https://github.com/kti/python-netfilterqueue")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgbase}"
	( set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd "${srcdir}/${_pkgbase}"
    #python setup.py build
    python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${_pkgbase}"
    #python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    python -m installer --destdir="$pkgdir" dist/*.whl
}
