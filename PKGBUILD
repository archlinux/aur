# Maintainer: Sergey Astanin s<dot>astanin<at>gmail<dot>com
# Contributor: Mikhail felixoid Shiryaev mr<dot>felixoid<at>gmail<dot>com

_name=tabulate
pkgdesc='Pretty-print tabular data in Python, a library and a command-line utility.'
url="https://github.com/astanin/python-${_name}"
pkgname="python-${_name}-git"
pkgver=0.8.11.r556.3f0757e
pkgrel=1
arch=('any')
makedepends=('python-setuptools')
license=('MIT')
source=("${_name}::git+${url}.git")
provides=( "python-${_name}" )
conflicts=( "python-${_name}" )
sha1sums=('SKIP')

pkgver() {
	cd "${_name}"
	_version=$(python setup.py -V)
	( set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "%s.r%s.%s" "${_version}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

package() {
	cd "${srcdir}/${_name}"
	python setup.py install --root="${pkgdir}" --optimize=1
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/"LICENSE
}

