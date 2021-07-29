# Maintainer:  <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: MCMic <come@chilliet.eu>

pkgname=deadascend
pkgver=1.1.2
pkgrel=2
pkgdesc="A 2D point'n'click-like adventure game written in Qt/QML and Javascript"
arch=('any')
url="https://blackgrain.dk/games/deadascend/"
license=('MIT')
depends=('sdl' 'sdl_mixer' 'qt5-base' 'qt5-multimedia' 'qt5-quickcontrols2')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Larpon/DeadAscend/archive/v${pkgver}.tar.gz"
	      "qak-1.4.2.tar.gz::https://github.com/Larpon/qak/archive/v1.4.2.tar.gz"
	      "qtfirebase-1.5.0.tar.gz::https://github.com/Larpon/QtFirebase/archive/v1.5.0.tar.gz"
        "${pkgname}.desktop"
        "${pkgname}.png")
sha256sums=('56871cd3a26b9b8b9101b750d08345f8769c180cfea33323c7a9fd60073ffdec'
            'e57809e074a40552cd3b27b56d0fe9c3a8978e53c9552c953cbf2910cfcb5849'
            '3ea83e636f951b1e9e14e6c67613628dbfc4044f1b20cd96c48bd9be9de963fd'
            '9b661723eb065216128f853680a21c095383dad66c9ccaa5defe6d20665a6131'
            'd12a6e505907d2f1a298a08305f43f3d29f7433e10bb3e672509dc6d08dca2aa')

build() {
	cd ${srcdir}/DeadAscend-${pkgver}
	
	cp -r ${srcdir}/qak-1.4.2 ./extensions/qak
	cp -r ${srcdir}/QtFirebase-1.5.0 ./extensions/QtFirebase

  qmake -r "BIN_DIR=/usr/bin" "ASSETS_DIR=/usr/share/deadascend"
  make assetsrcc -C App
  make
}

package() {
	cd ${srcdir}/DeadAscend-${pkgver}

	make install INSTALL_ROOT=${pkgdir}
 
	install -Dm644 App/assets.rcc ${pkgdir}/usr/share/deadascend/
	mv ${pkgdir}/usr/bin/DeadAscend ${pkgdir}/usr/bin/deadascend
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${startdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${startdir}/${pkgname}.png" ${pkgdir}/usr/share/icons/hicolor/128x128/apps/${pkgname}.png
  

}
