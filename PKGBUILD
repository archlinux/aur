# Maintainer: Wiliam Souza wiliamsouza83<at>gmail<dot>com
# Contributor: Mikhail felixoid Shiryaev mr<dot>felixoid<at>gmail<dot>com

_name=systemd-dbus
pkgdesc='Python wrapper for systemd system and session manager dbus interfaces'
url="https://github.com/wiliamsouza/python-systemd"
pkgbase="python-${_name}-git"
pkgname=("python-${_name}-git" "python2-${_name}-git")
pkgver=0.1.r29.d930fea
pkgrel=2
arch=('any')
makedepends=('python-setuptools' 'python2-setuptools')
license=('LGPL-2.1')
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

package_python2-systemd-dbus-git() {
	provides=( 'python2-systemd-dbus' )
	conflicts=( 'python2-systemd-dbus' )
	cd "${srcdir}/${_name}"
	python2 setup.py install --root="${pkgdir}" --optimize=1
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/"LICENSE
}

package_python-systemd-dbus-git() {
	provides=( 'python-systemd-dbus' )
	conflicts=( 'python-systemd-dbus' )
	cd "${srcdir}/${_name}"
	python setup.py install --root="${pkgdir}" --optimize=1
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/"LICENSE
}


