# Maintainer: katt <magunasu.b97@gmail.com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: James Rayner <james@archlinux.org>
# Contributor: Partha Chowdhury <kira.laucas@gmail.com>

pkgname=conky-katt
pkgver=1.12.1
pkgrel=1
pkgdesc='Lightweight system monitor for X (without nvidia, docs and wlan)'
arch=(x86_64)
url=https://github.com/brndnmtthws/conky
license=(BSD GPL)
depends=(glibc glib2 lua libxdamage libxinerama libxft imlib2 libxml2 libpulse systemd-libs ncurses curl libncursesw.so libsystemd.so libpulse.so libcurl.so)
makedepends=(cmake man-db git)
provides=("${pkgname%-katt}")
conflicts=("${pkgname%-katt}")
source=(git+${url}.git#tag=v"${pkgver}"?signed)
sha256sums=('SKIP')
validpgpkeys=('EB2E847572A71BE20F59AFBEB49ABB7270D9D4FD') # Brenden Matthews

build() {
	cmake -B build -S "${pkgname%-katt}" \
		-DCMAKE_BUILD_TYPE=None \
		-DMAINTAINER_MODE=ON \
		-DBUILD_XDBE=ON \
		-DBUILD_XSHAPE=ON \
		-DBUILD_IMLIB2=ON \
		-DBUILD_CURL=ON \
		-DBUILD_RSS=ON \
		-DBUILD_WEATHER_METAR=ON \
		-DBUILD_PULSEAUDIO=ON \
		-DBUILD_JOURNAL=ON \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-Wno-dev
	cmake --build build
}

package() {
	DESTDIR="${pkgdir}" cmake --install build
	cd "${pkgname%-katt}"
	install -Dm644 COPYING "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
	install -Dm644 extras/vim/syntax/conkyrc.vim "${pkgdir}"/usr/share/vim/vimfiles/syntax/conkyrc.vim
	install -Dm644 extras/vim/ftdetect/conkyrc.vim "${pkgdir}"/usr/share/vim/vimfiles/ftdetect/conkyrc.vim
}
