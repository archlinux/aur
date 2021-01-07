# Maintainer: Mohammad Zolfaghari <zidom72@gmail.com>
arch=('x86_64')
license=('GPL3')
pkgdesc="Meikade is a poetry application"
pkgname=meikade
pkgver=4.2.2
pkgrel=1
depends=('qt5-base')
source=(
	'meikade.desktop'
	"https://github.com/Aseman-Land/Meikade/releases/download/${pkgver}/Meikade-Linux-${pkgver}.xz"
	"git+https://github.com/Aseman-Land/QtAseman.git"
	"https://raw.githubusercontent.com/Aseman-Land/Meikade/master/configurations/ios/icons/AppIcon40x40%402x.png"
)
sha256sums=(
	'd404ae996967334f9813a043b2aa0a5aa7ac19b90c8a9f6ac0d05aaf32529bdf'
	'bfd18aa478e76c2353562fd24822247b25b66b5b88a582af5554cbc9b60dfbcf'
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
	install -D -m755 "${srcdir}/Meikade-Linux-${pkgver}" "$pkgdir/usr/lib/meikade/Meikade"
	cd "${srcdir}/QtAseman/build"
	make INSTALL_ROOT="$pkgdir" install
}
