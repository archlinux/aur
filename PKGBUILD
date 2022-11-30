# Maintainer: Mohammad Zolfaghari <zidom72@gmail.com>
arch=('x86_64')
license=('GPL3')
pkgdesc="Meikade is a poetry application"
pkgname=meikade
pkgver=4.4.0
pkgrel=2
depends=('qt5-base' 'qt5-location' 'qt5-multimedia')
makedepends=('git')
source=(
	'meikade.desktop'
	"https://github.com/Aseman-Land/Meikade/releases/download/${pkgver}/Meikade-${pkgver}-Linux-x86_64.xz"
	"git+https://github.com/Aseman-Land/QtAseman.git"
	"https://raw.githubusercontent.com/Aseman-Land/Meikade/master/configurations/ios/icons/AppIcon40x40%402x.png"
)
sha256sums=(
	'd404ae996967334f9813a043b2aa0a5aa7ac19b90c8a9f6ac0d05aaf32529bdf'
	'6a3bfc5b2f0cf6a8a59f01cc6b5f441c9d01f124480515e940380f04d22d602f'
	'SKIP'
	'ffcf1cb0edd57d1efa9ecb6029744a4c0182eccdefa2a37b17e7b81df5f3e93c'
)
url='https://github.com/Aseman-Land/Meikade'

build() {
	cd "${srcdir}/QtAseman"
	mkdir build
	cd build
	qmake -r ..
	make -j2
}

package() {
	install -D -m644 "${srcdir}/meikade.desktop" "$pkgdir/usr/share/applications/meikade.desktop"
	install -D -m644 "${srcdir}/AppIcon40x40%402x.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps/Meikade.png"
	install -D -m755 "${srcdir}/Meikade-${pkgver}-Linux-x86_64" "$pkgdir/usr/lib/meikade/Meikade"
	cd "${srcdir}/QtAseman/build"
	make INSTALL_ROOT="$pkgdir" install
}
