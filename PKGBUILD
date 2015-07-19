# Maintainer: lothar_m <lothar_m at riseup dot net>
_pkgname=ofxclient
pkgname=$_pkgname-git
pkgver=0
pkgrel=1
pkgdesc="Simple ofxclient command line utility and OFX client libraries for development."
arch=('x86_64' 'i686')
url="https://github.com/captin411/ofxclient"
license=('MIT')
depends=('python2>=2.7'
		'python2-beautifulsoup4'
		'ofxparse'
		'ofxhome'
		'python2-keyring'
		'python2-configargparse'
		)
# makedepends=()
provides=(ofxclient)
conflicts=(ofxclient)
source=('ofxclient::git+https://github.com/captin411/ofxclient.git#branch=master')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir$pkgname"
    ( set -o pipefail
	git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd "$srcdir/ofxclient"
	python2 setup.py build
}

package() {
	# install package
	cd "$srcdir/ofxclient"
	python2 setup.py install --root="$pkgdir/"
}

