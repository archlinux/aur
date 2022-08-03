# Maintainer: Python Zookeeper High-Level Libraries https://github.com/python-zk
# Contributor: Mikhail felixoid Shiryaev mr<dot>felixoid<at>gmail<dot>com

_name=kazoo
pkgname="python-${_name}-git"
pkgver=2.6.0.r60.g9bb8499
pkgrel=2
pkgdesc='kazoo implements a higher level API to Apache Zookeeper for Python clients.'
arch=('any')
url="https://github.com/python-zk/kazoo"
makedepends=('python-setuptools')
license=('APACHE')
provides=("python-${_name}")
conflicts=("python-${_name}")
depends=('python' 'python-objgraph')
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

package() {
	cd "${srcdir}/${_name}"
	python setup.py install --root="${pkgdir}" --optimize=1
}

