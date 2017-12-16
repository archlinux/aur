# Maintainer: Guillaume Brogi <gui-gui at netcourrier dot com>
# Contributor: Doron Behar <doron.behar@gmail.com>
pkgname=git-repo-git
pkgver=1.10.3.r10.ge80d990
pkgrel=1
pkgdesc="Tool for managing remote repositories from your git CLI!"
arch=('any')
url="https://github.com/guyzmo/git-repo"
license=('GPL2')
depends=('python' 'python-docopt' 'python-progress' 'python-dateutil' 'python-lxml' 'python-gitpython' 'python-github3' 'python-gitlab>=0.18' 'python-gogs-client' 'python-pybitbucket_fork' 'python-attrs')
conflicts=('git-repo')
replaces=('git-repo')
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

