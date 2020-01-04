pkgbase=python-telepot-git
pkgname=("python-telepot-git" "python2-telepot-git")
_reponame="telepot"
pkgver=r431.4bfe4ee
pkgrel=2
pkgdesc="telepot protocol implementation for Python"
arch=('any')
license=('MIT')
url="https://github.com/nickoala/${_reponame}"
makedepends=('git' 'python-setuptools' 'python2-setuptools')
source=("${_reponame}"::"git+https://github.com/nickoala/${_reponame}")
sha512sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_reponame}"
	( set -o pipefail
	git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' \
	|| printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

prepare() {
	cp -a "${srcdir}/${_reponame}/telepot"{,-py2}
}

build_python-telepot-git() {
	cd "${srcdir}/${_reponame}/telepot"
	python setup.py clean
	rm -rf build dist
	python setup.py build
}

build_python2-telepot-git() {
	cd "${srcdir}/${_reponame}/telepot-py2"
	python2 setup.py clean
	rm -rf build dist
	python2 setup.py build
}

package_python-telepot-git() {
	depends=('python-setuptools')

	cd "${srcdir}/${_reponame}"
	python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-telepot-git() {
	depends=('python2-setuptools')

	cd "${srcdir}/${_reponame}"
	python2 setup.py install --root="${pkgdir}" --optimize=1
}
