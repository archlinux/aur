# Maintainer: twa022 <twa022 at gmail dot com>
# Contributor: Alexey Rochev <equeim at gmail dot com>

_pkgname=snw-plugin
pkgname="mate-${_pkgname}"
pkgver=0.8
pkgrel=1
pkgdesc="Mate panel plugin to show StatusNotifierItems (AppIndicators)"
url="https://github.com/equeim/snw-plugin"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('libdbusmenu-gtk2')
if [[ `pacman -Qq mate-panel-gtk3 2>/dev/null` ]] ; then
	depends+=('mate-panel-gtk3')
else
	depends+=('mate-panel')
fi
makedepends=('vala' 'python' 'intltool')
source=("${_pkgname}-${pkgver}.tar.gz"::"${url}/archive/${pkgver}.tar.gz")
sha256sums=('dd62c4f75221965a280e4b6c41ea785a7796a8d7be939327fe94b0835677b612')

prepare() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	./waf configure --prefix="/usr" --libdir="/usr/lib" --mate
}

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	./waf build
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	./waf install --destdir="${pkgdir}"
}
