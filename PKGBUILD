# Contributor: Vojtech Horky <AUR / hotspur>
pkgname=bzr-bisect-bzr
pkgver=84
pkgrel=1
pkgdesc="Bazaar plugin to find a bug using binary search"
arch=('any')
url="https://launchpad.net/bzr-bisect/"
license=('GPL')
depends=("python2" "bzr")
makedepends=("bzr" "python2")
source=()
md5sums=()
_bzrbranch="lp:bzr-bisect"
_bzrname="bzr-bisect"

build() {
	cd "${srcdir}"
	msg "Connecting to BZR server..."

	if [ -d "${srcdir}/${_bzrname}" ] ; then
		cd "${_bzrname}" && bzr pull "${_bzrbranch}"
		msg "Local repository updated."
	else
		bzr co "${_bzrbranch}"
		msg "BZR checkout done or server timeout"
	fi
}

package() {
	cd "${srcdir}/${_bzrname}"
	python2 ./setup.py install --prefix=/usr --root "${pkgdir}"
}
