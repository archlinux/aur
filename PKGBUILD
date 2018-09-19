# Maintainer: Sergey Astanin s<dot>astanin<at>gmail<dot>com
# Contributor: Mikhail felixoid Shiryaev mr<dot>felixoid<at>gmail<dot>com

_name=tabulate
pkgdesc='Pretty-print tabular data in Python, a library and a command-line utility.'
url="https://bitbucket.org/astanin/python-tabulate"
pkgbase="python-${_name}-git"
pkgname=("python-${_name}-git" "python2-${_name}-git")
pkgver=0.8.3.r367.433dfc6
pkgrel=1
arch=('any')
makedepends=('python-setuptools' 'python2-setuptools')
license=('MIT')
source=("${_name}::git+${url}.git")
sha1sums=('SKIP')

pkgver() {
	cd "${_name}"
	_version=$(python setup.py -V)
	( set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "%s.r%s.%s" "${_version}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

package_python2-tabulate-git() {
	provides=( 'python2-tabulate' )
	conflicts=( 'python2-tabulate' )
	cd "${srcdir}/${_name}"
	python2 setup.py install --root="${pkgdir}" --optimize=1
	# Waiting for https://github.com/axiros/terminal_markdown_viewer/pull/42
	mv "${pkgdir}/usr/bin/${_name}"  "${pkgdir}/usr/bin/${_name}2"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/"LICENSE
}

package_python-tabulate-git() {
	provides=( 'python-tabulate' )
	conflicts=( 'python-tabulate' )
	cd "${srcdir}/${_name}"
	python setup.py install --root="${pkgdir}" --optimize=1
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/"LICENSE
}

