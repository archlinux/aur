# Maintainer: Melvin Laplanche <melvin.laplanche+pkgbuild[at]gmail[dot]com>

pkgname='plymouth-theme-asphyxia-git'
pkgver=20120923
pkgrel=1
pkgdesc='Plymouth theme featuring the famous asphyxia picture from starweaver'
arch=('any')
url='http://www.laplanche-melv.in'
license=('GPL')
depends=('plymouth')
makedepends=('git')
options=(!strip)

_gitroot="git://github.com/Nivl/plymouth-theme-asphyxia.git"
_gitname="plymouth-theme-asphyxia"

build() {
	cd "$srcdir"
	msg "Connecting to GIT server...."

	if [ -d $_gitname ] ; then
		cd $_gitname && git pull origin
		msg "The local files are updated."
	else
		git clone $_gitroot $_gitname
	fi

	msg "GIT checkout done or server timeout"
}


package() {
	cd "${srcdir}/${_gitname}/asphyxia"
	install -m755 -d "${pkgdir}/usr/share/plymouth/themes/asphyxia"
	install -m644 -t "${pkgdir}/usr/share/plymouth/themes/asphyxia" *
}
