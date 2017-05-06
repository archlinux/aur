# Maintainer: Adam Hose <adis@blad.is>

_pkgbase=python-netfilterqueue
pkgname=python-netfilterqueue-git
pkgver=r66.3fa8a38
pkgrel=1
pkgdesc="Python 3.x for libnetfilter_queue."
arch=('any')
url="https://github.com/kti/python-netfilterqueue"
license=("GPL2")
depends=('python' 'libnetfilter_queue')
source=("${_pkgbase}::git+https://github.com/kti/python-netfilterqueue")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgbase}"
	( set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

package() {
	cd "${srcdir}/${_pkgbase}"
	python setup.py install -O1 --root="$pkgdir"
}
