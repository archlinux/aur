# Maintainer: Guillaume Brogi <gui-gui at netcourrier dot com>
pkgname=python-pybitbucket_fork-git
pkgver=r378.6a2fba5
pkgrel=2
provides=('python-pybitbucket' 'python-pybitbucket_fork')
conflicts=('python-pybitbucket' 'python-pybitbucket_fork')
pkgdesc="Tool for managing remote repositories from your git CLI!"
arch=('any')
url="https://github.com/guyzmo/pybitbucket"
license=('GPL2')
depends=('python' 'python-future' 'python-six' 'python-requests' 'python-requests-oauthlib' 'python-oauthlib' 'python-uritemplate' 'python-simplejson' 'python-voluptuous')
makedepends=('python-setuptools' 'python-pip')
source=("${pkgname}::git+${url}")
sha256sums=(SKIP)

pkgver() {
	cd "$pkgname"
	( set -o pipefail
	git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

package() {
	cd "$srcdir/$pkgname"
	python setup.py install --root="${pkgdir}" --optimize=1
}

