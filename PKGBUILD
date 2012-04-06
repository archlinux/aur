# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=linect-git
pkgver=20101209
pkgrel=1
pkgdesc="An Open Source Kinect Linux module driver compatible with Video4Linux 2"
arch=('i686' 'x86_64')
url="https://github.com/berfenger/linect"
license=('GPL')
depends=()
makedepends=('kernel26-headers' 'git')
provides=('linect')
conflicts=('linect')
source=()
install="${pkgname}.install"
md5sums=()

_gitroot="git://github.com/berfenger/linect.git"
_gitname="linect"

build() {
	cd "${srcdir}"
	
	if [ ! -d "${srcdir}/${_gitname}" ]; then
		git clone ${_gitroot}
	else
		cd ${_gitname}  && git pull origin
	fi
	
	msg "GIT checkout done."

	rm -rf "${srcdir}/${_gitname}-build"
	cp -r "${srcdir}/${_gitname}" "${srcdir}/${_gitname}-build"
	cd "${srcdir}/${_gitname}-build"

	make
}

package() {
	cd "${srcdir}/${_gitname}-build"
	
	install -Dm644 linect.ko "${pkgdir}/lib/modules/`uname -r`/kernel/drivers/misc/linect.ko"

}
