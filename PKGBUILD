# Maintainer: coldbug <coldBug@e.mail.de>
_pkgbase=faraday_plugins
pkgname=python-faraday-plugins-git
pkgver=v1.2.3.r0.gf46ca79
pkgrel=1
pkgdesc="Faraday Plugins"
arch=('any')
url="https://github.com/infobyte/faraday_plugins"
license=("GPL2")
depends=('python' 'python-beautifulsoup4' 'python-html2text' 'python-tqdm' 'python-simplejson' 'python-deprecation' 'python-click' 'python-requests' 'python-lxml' 'python-pytz' 'python-dateutil' 'python-colorama')
makedepends=('git' 'python-setuptools')
source=("git+https://github.com/infobyte/faraday_plugins.git")
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

