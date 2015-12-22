#  Maintainer: Sinnamon (George Aladin) <AngleSi at yahoo dot com>

pkgname=loop-aes
_pkgname=loop-AES
pkgver=v3.7f
pkgrel=1
pkgdesc="This package provides loadable Linux kernel module loop
that has AES cipher built-in."
arch=('i686' 'x86_64')
license=('GPL2')
url="http://loop-aes.sourceforge.net"
depends=('linux' 'util-linux-aes')
makedepends=('linux-headers')
install=${pkgname}.install

source=(${url}/${_pkgname}/${_pkgname}-${pkgver}.tar.bz2)

md5sums=('5f50564b9aa67b6c96e363e81899a92c')

build() {
	cd ${srcdir}/${_pkgname}-${pkgver}
	make MODINST=n -j1 LINUX_SOURCE=/usr/lib/modules/$(uname -r)/build || return 1

}

package() {
	cd ${srcdir}/${_pkgname}-${pkgver}/tmp-d-kbuild/
	gzip loop.ko
	install -D loop.ko.gz ${pkgdir}/usr/lib/modules/$(uname -r)/$(readlink /usr/lib/modules/$(uname -r)/extramodules)/loop.ko.gz
	
}
