# Maintainer: coldbug <coldBug@e.mail.de>
_pkgbase=faraday-client
pkgname=python-faraday-client-git
pkgver=v1.0.0.r0.g0a23bf04
pkgrel=1
pkgdesc="Faraday GTK Client"
arch=('any')
url="https://github.com/infobyte/faraday-client"
license=("GPL2")
depends=('python' 'python-websocket-client' 'python-colorama' 'python-deprecation' 'python-dateutil' 'python-flask' 'python-requests' 'python-tornado' 'python-tqdm' 'pygobject-devel' 'python-html2text' 'python-xlsxwriter' 'python-cairocffi' 'python-cairo' 'python-faraday-plugins-git')
makedepends=('git' 'python-setuptools')
source=("git+https://github.com/infobyte/faraday-client.git")
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
    python setup.py build
}

package() {
	cd "${srcdir}/${_pkgbase}"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

