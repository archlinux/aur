# Maintainer: Gunther Klessinger gk<at>axiros<dot>com
# Contributor: Mikhail felixoid Shiryaev mr<dot>felixoid<at>gmail<dot>com

_name=mdv
pkgdesc='Styled Terminal Markdown Viewer'
url="https://github.com/axiros/terminal_markdown_viewer"
pkgbase="python-${_name}-git"
# Waiting for https://github.com/axiros/terminal_markdown_viewer/pull/42
# pkgname=("python-${_name}-git" "python2-${_name}-git")
pkgname=("python2-${_name}-git" "python-${_name}-git")
pkgver=1.6.3.r66.gfe06a0f
pkgrel=1
arch=('any')
makedepends=('python-setuptools' 'python2-setuptools')
license=('BSD')
source=("${_name}::git+${url}.git")
sha1sums=('SKIP')

pkgver() {
	cd "${_name}"
	_version=$(python setup.py -V)
	( set -o pipefail
		git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "%s.r%s.%s" "${_version}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

package_python2-mdv-git() {
	depends=('python2' 'python2-markdown' 'python2-tabulate' 'python2-pygments' 'python2-docopt')
	conflicts=( 'terminal_markdown_viewer' )
	cd "${srcdir}/${_name}"
	python2 setup.py install --root="${pkgdir}" --optimize=1
	mv "${pkgdir}/usr/bin/mdv"  "${pkgdir}/usr/bin/mdv2"
	install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/"LICENSE
}

package_python-mdv-git() {
	depends=('python' 'python-markdown' 'python-tabulate' 'python-pygments' 'python-docopt')
	conflicts=( 'terminal_markdown_viewer' )
	cd "${srcdir}/${_name}"
	python setup.py install --root="${pkgdir}" --optimize=1
	install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/"LICENSE
}
