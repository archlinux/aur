# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname='python2-lightblue-pebble-git'
pkgdesc='Cross-platform Bluetooth API for Python (with Pebble patches)'
url='https://github.com/pebble/lightblue-0.4'
license=('GPL3')
pkgver=r30.86b5c89
pkgrel=1
arch=('i686' 'x86_64')
depends=('python2' 'python2-pybluez' 'openobex')
makedepends=('git')
source=("${pkgname}::git+${url}")
sha512sums=('SKIP')

pkgver () {
	cd "${pkgname}"
	( set -o pipefail
      git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

package () {
	cd "${pkgname}"
	python2 setup.py install --root="${pkgdir}"
}
