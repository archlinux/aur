# Maintainer: Python Zookeeper High-Level Libraries https://github.com/python-zk
# Contributor: Mikhail felixoid Shiryaev mr<dot>felixoid<at>gmail<dot>com

_name=kazoo
pkgbase="python-${_name}-git"
pkgname=("python-${_name}-git" "python2-${_name}-git")
pkgver=2.6.0.r10.gcd49b3f
pkgrel=1
pkgdesc='kazoo implements a higher level API to Apache Zookeeper for Python clients.'
arch=('any')
url="https://github.com/python-zk/kazoo"
makedepends=('python-setuptools' 'python2-setuptools')
license=('APACHE')
source=("${_name}::git+${url}.git")
sha1sums=('SKIP')

pkgver() {
	cd "${_name}"
	_version=$(python setup.py -V)
	( set -o pipefail
		git describe --tag 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "%s.r%s.%s" "${_version}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

package_python2-kazoo-git() {
	depends=('python2' 'python2-objgraph')
	cd "${srcdir}/${_name}"
	python2 setup.py install --root="${pkgdir}" --optimize=1
}

package_python-kazoo-git() {
	depends=('python' 'python-objgraph')
	cd "${srcdir}/${_name}"
	python setup.py install --root="${pkgdir}" --optimize=1
}

