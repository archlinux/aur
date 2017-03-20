# Maintainer: twa022 <twa022 at gmail dot com>
# Contributor: Alexey Rochev <equeim at gmail dot com>

_gtk=2
_pkgname=snw-plugin
pkgname="xfce4-${_pkgname}"
pkgver=0.10.0
pkgrel=1
url="https://github.com/equeim/snw-plugin"
pkgdesc="Xfce panel plugin to show StatusNotifierItems (AppIndicators)"
arch=('i686' 'x86_64')
license=('GPL3')
if [[ ${_gtk} -eq 3 ]] ; then
	depends=('libdbusmenu-gtk3' 'xfce4-panel-git')
	_gtkflag="--gtk3"
else
	depends=('libdbusmenu-gtk2' 'xfce4-panel')
	_gtkflag=""
fi
makedepends=('vala' 'python' 'intltool')
source=("${_pkgname}-${pkgver}.tar.gz"::"${url}/archive/${pkgver}.tar.gz")
sha256sums=('e34241ce1b4a1d4f85bf12d05ecafce62032cdfd26ac9df247a79111cc79e343')

prepare() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	./waf configure --prefix="/usr" --libdir="/usr/lib" "${_gtkflag}"
}

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	./waf build
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	./waf install --destdir="${pkgdir}"
}
