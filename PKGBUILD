# Maintainer: Rachel Mant <dx-mon@users.sourceforge.net>

pkgname=crunch-test
_pkgname=crunch
pkgver=1.1.1
pkgrel=1
pkgdesc="crunch your code. Crunch is a unit testing framework written for C and C++."
arch=('x86_64' 'i386' 'aarch64')
license=('LGPL3')
url="https://github.com/DX-MON/crunch"
depends=()
makedepends=('ninja' 'meson')
provides=('crunch++')
source=("https://github.com/DX-MON/crunch/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.xz"{,.asc})
sha256sums=('bef4d52588ebf2534387e557c235cc1ea85d5890e91c15e28689bbc06a09548f' 'SKIP')
validpgpkeys=(
	'5E30DFF73626CA96F83DDF5E0137BA904EBDB4CD' # "Rachel Mant <dx-mon@users.sourceforge.net>"
)

build()
{
	cd ${_pkgname}-${pkgver}
	meson build --prefix=/usr
	ninja -C build
}

check()
{
	cd ${_pkgname}-${pkgver}
	ninja -C build test
}

package()
{
	cd ${_pkgname}-${pkgver}
	DESTDIR="${pkgdir}" ninja -C build install
}
