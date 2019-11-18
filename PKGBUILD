# Maintainer: Vojtech Horky <github.com/vhotspur>

pkgname=d3s-nagios-plugins-git
_reponame="d3s-nagios-plugins"
pkgver=r9.9865cf3
pkgrel=1
pkgdesc="A collection of various mini-plugins for Nagios."
arch=('any')
license=('Apache')
url="https://github.com/D-iii-S/d3s-nagios-plugins"
# Most AUR helpers unfortunately do not support versioned deps in the AUR ("python-acme=${pkgver}")
depends=('python')
makedepends=('git' 'python-setuptools')
source=("${_reponame}"::"git+https://github.com/D-iii-S/${_reponame}.git")
sha512sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_reponame}"
	( set -o pipefail
	   git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' \
	   || printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
    cd "${srcdir}/${_reponame}"

    python setup.py build
}

package() {
    cd "${srcdir}/${_reponame}"
    
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
