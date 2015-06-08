# Maintainer: dobo <dobo90_at_gmail.com>
## Contributor : nemOn(YarLUG)
# based pkgbuild fancris3

pkgname=linuxdcpp-bzr
pkgver=401
pkgrel=1
pkgdesc="latest bzr trunk"
url=https://launchpad.net/linuxdcpp
license=(GPL)
arch=(i686 x86_64)
depends=(bzip2 gcc-libs libglade hicolor-icon-theme)
makedepends=(bzr scons pkgconfig boost)
install=linuxdcpp-bzr.install
conflicts=(linuxdcpp linuxdcpp-cvs)

_bzrtrunk=https://code.launchpad.net/~linuxdcpp-team/linuxdcpp/trunk
_bzrmod=trunk

build() {
	cd ${srcdir}

	if [ ! -d ./${_bzrmod} ]; then
		bzr co ${_bzrtrunk} ${_bzrmod}
	else
		bzr up ${_bzrmod}
	fi

	cd ${srcdir}/trunk

	scons PREFIX=/usr LIBDIR=/usr/share
}

package() {
	cd ${srcdir}/trunk
	scons install FAKE_ROOT=${pkgdir}
}

