# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname='persepolis-git'
pkgver=3.0.1.r0.gf76881a
pkgrel=1
pkgdesc="A graphical front-end for aria2 download manager with lots of features (Github version)."
arch=('any')
url="https://persepolisdm.github.io/"
license=('GPL3')
depends=('aria2' 'libnotify' 'python' 'python-psutil' 'python-pyqt5' 'python-requests' 'python-setproctitle' 'qt5-svg' 'sound-theme-freedesktop')
makedepends=('git' 'python-setuptools')
optdepends=('firefox-flashgot: for integrating with firefox')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+https://github.com/persepolisdm/persepolis.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	( set -o pipefail
	  git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
	  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

prepare() {
    cd "${srcdir}/${pkgname}"
    gzip -k -9 ./man/persepolis.1
}

package() {
	cd "${srcdir}/${pkgname}"
	python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1
}
# vim:set ts=2 sw=2 et:
