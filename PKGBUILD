# Maintainer: lothar_m <lothar_m at riseup dot net>
_pkgname=ofxclient
pkgname=python-ofxclient-git
pkgver=2.0.4.r0.g4da2719
pkgrel=1
pkgdesc="Simple ofxclient command line utility and OFX client libraries for development."
arch=('x86_64' 'i686')
url="https://github.com/captin411/ofxclient"
license=('MIT')
depends=('python>=3.7'
		'python-beautifulsoup4'
		'ofxparse'
		'ofxhome'
		'python-keyring'
		'python-configargparse'
		'python-ofxparse'
		)
# makedepends=()
provides=(ofxclient)
conflicts=(ofxclient)
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
	cd "$srcdir/$_pkgname"
	python setup.py build
}

package() {
	# install package
	cd "$srcdir/$_pkgname"
	python setup.py install --root="$pkgdir/"
}

