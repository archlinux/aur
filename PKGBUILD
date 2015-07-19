# Maintainer: lothar_m <lothar_m at riseup dot net>
_pkgname=ledgerhub
pkgname=$_pkgname-git
pkgver=0
pkgrel=1
pkgdesc="Common code that can convert various transaction detail files and statement from financial institutions into the various Ledger implementations."
arch=('x86_64' 'i686')
url="https://bitbucket.org/blais/ledgerhub"
license=('GPL')
depends=('python3>=3.3'
		'python-beautifulsoup4'
		)
# makedepends=()
provides=($_pkgname)
conflicts=($_pkgname)
source=('ledgerhub::git+https://bitbucket.org/blais/ledgerhub#branch=default')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir$pkgname"
    ( set -o pipefail
	git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

#build() {
#	cd "$srcdir/$_pkgname"
#	python3 setup.py build
#}

package() {
	# install package
	cd "$srcdir/$_pkgname"
	python3 setup.py install --root="$pkgdir/"
}

