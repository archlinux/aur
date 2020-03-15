# Maintainer: Gilbert Gilb's <gilbsgilbert@gmail.com>

pkgname="py-parrot-zik-git"
_reponame="pyParrotZik"
pkgver=r170.584ee9d
pkgrel=1
pkgdesc="PyParrotZik is a simple applet indicator for Parrot Zik headset."
arch=('any')
license=('GPLv2+')
url="https://github.com/m0sia/${_reponame}"
depends=('python2-pybluez' 'python2-beautifulsoup4' 'python2-dbus' 'python2-libappindicator' 'pygtk')
makedepends=('git' 'python2-setuptools')
source=("${_reponame}"::"git+https://github.com/m0sia/${_reponame}")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_reponame}"
	( set -o pipefail
	git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' \
	|| printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd "${srcdir}/${_reponame}"
	python2 setup.py clean
	rm -rf build dist
	python2 setup.py build
}

package() {
	cd "${srcdir}/${_reponame}"
	python2 setup.py install --root="${pkgdir}"
}

