# Maintainer: Tiago Levita <liamgliam [at] goog [] le.com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: James Rayner <james@archlinux.org>
# Contributor: Partha Chowdhury <kira.laucas@gmail.com>

pkgname=conky-cairo-no-nvidia
_pkgname=conky
pkgver=1.11.5
pkgrel=2
pkgdesc='Lightweight system monitor for X - with cairo and without nvidia'
url='https://github.com/brndnmtthws/conky'
license=('BSD' 'GPL')
arch=('x86_64')
makedepends=('cmake' 'docbook2x' 'docbook-xsl' 'man-db' 'git')
depends=('cairo' 'glib2' 'lua' 'wireless_tools' 'libxdamage' 'libxinerama' 'libxft'
         'imlib2' 'libxml2' 'libpulse')
provides=("conky")
conflicts=('conky')
replaces=('conky')
source=("https://github.com/brndnmtthws/conky/archive/v${pkgver}.tar.gz")
sha256sums=('4cefdd92219a90934c28297e4ac7448a3f69d6aeec5d48c5763b23f6b214ef13')
options=('!strip' 'debug')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"

	cmake \
		-D CMAKE_BUILD_TYPE=Release \
		-D MAINTAINER_MODE=ON \
        -D BUILD_LUA_CAIRO=ON \
        -D BUILD_LUA_IMLIB2=ON \
		-D BUILD_DOCS=ON \
		-D BUILD_WLAN=ON \
		-D BUILD_XDBE=ON \
		-D BUILD_XSHAPE=ON \
		-D BUILD_IMLIB2=ON \
		-D BUILD_CURL=ON \
		-D BUILD_RSS=ON \
		-D BUILD_WEATHER_METAR=ON \
		-D BUILD_PULSEAUDIO=ON \
		-D BUILD_JOURNAL=ON \
		-D CMAKE_INSTALL_PREFIX=/usr \
		.

	make
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
	install -Dm644 extras/vim/syntax/conkyrc.vim "${pkgdir}"/usr/share/vim/vimfiles/syntax/conkyrc.vim
	install -Dm644 extras/vim/ftdetect/conkyrc.vim "${pkgdir}"/usr/share/vim/vimfiles/ftdetect/conkyrc.vim
}
