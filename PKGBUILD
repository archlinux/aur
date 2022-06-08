# Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>

pkgname=tricks
pkgver=0.9.0
pkgrel=4
pkgdesc="The social network for programmers!"
arch=('x86_64')
url="https://tricks.aseman.io/"
license=('GPL3')
makedepends=('gcc' 'git' 'qt5-svg')
depends=('qt-aseman' 'syntax-highlighting' 'qt5-base' 'qt5-graphicaleffects' 'qt5-quickcontrols2')
conflicts=('tricks-bin')
options=('!emptydirs' '!strip')
source=("git+https://github.com/Aseman-Land/Tricks.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
	cd ${srcdir}/Tricks/
	mkdir -p build && cd build
	qmake -r .. APP_SECRET_ID="tapp_eb7536ef1cdc592f6b503addeaddd8e6c94cfb110f0e08a15b0bc97cef0beb1d" CONFIG+="qtquickcompiler"
	make -j4
}

package() {
	mkdir -p "${pkgdir}"/usr/share/icons/hicolor/
	install -D -m644 Tricks/configurations/default/linux/share/Tricks.desktop -t "${pkgdir}"/usr/share/applications/
	install -D -m755 Tricks/build/tricks -T "${pkgdir}"/usr/bin/tricks
	cp -r Tricks/configurations/default/linux/share/hicolor/* "${pkgdir}"/usr/share/icons/hicolor/
	install -D -m644 Tricks/LICENSE -t "${pkgdir}"/usr/share/licenses/"${pkgname}"/
}
