# Maintainer: Adrian Perez <aperez@igalia.com>
pkgname='beancount-hg'
pkgdesc='Double-Entry Accounting from Text Input'
pkgver=2.2.0.r2.9d7552d320a3
pkgrel=1
arch=('i686' 'x86_64')
url="http://furius.ca/beancount/"
license=('GPL')
source=("${pkgname}::hg+https://bitbucket.org/blais/beancount/")
sha1sums=('SKIP')
depends=('python>=3.5' 'mpdecimal' 'python-ply' 'python-dateutil'
		 'python-magic-ahupp' 'python-beautifulsoup4' 'python-chardet'
		 'python-bottle' 'python-lxml' 'python-google-api-python-client')
makedepends=('mercurial' 'python-nose' 'make')
replaces=('ledgerhub-hg')
provides=('ledgerhub-hg' "beancount=${pkgver%%.r*}")
conflicts=('beancount')

pkgver() {
  cd "${pkgname}"
  hg log -r . --template '{latesttag}-{latesttagdistance}-{node|short}' | sed 's/^\([^-]*\)-\([^-]*\)-/\1.r\2./'
}

# TODO: Tests are failing at the moment, needs investigating.
# check () {
# 	cd "${pkgname}"
# 	export CFLAGS='-std=gnu99'
# 	make tests
# }

package () {
	cd "${pkgname}"
	python3 setup.py install --prefix=/usr --root="${pkgdir}"
}
