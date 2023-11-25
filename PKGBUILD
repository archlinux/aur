# Maintainer: Mathieu <mathieu@clabaut.net>
_pkgname=ofxclient
pkgname=python-ofxclient-git
pkgver=2.0.4.r0.g4da2719
pkgrel=5
pkgdesc="Simple ofxclient command line utility and OFX client libraries for development."
arch=('x86_64' 'i686')
url="https://github.com/captin411/ofxclient"
license=('MIT')
depends=('python>=3.7'
		'python-beautifulsoup4'
		'python-ofxhome'
		'python-keyring'
		'python-configargparse'
		'python-ofxparse'
		)
makedepends=(python-build python-installer python-wheel)
provides=(ofxclient python-ofxclient)
conflicts=(ofxclient python-ofxclient)
source=('ofxclient::git+https://github.com/captin411/ofxclient.git#branch=master')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
    ( set -o pipefail
	git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' || 
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
    cd "$_pkgname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

