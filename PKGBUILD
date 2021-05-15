# Maintainer: Christian Hesse <mail@eworm.de>
# Maintainer: Morten Linderud <foxboron@archlinux.org>

pkgname=yubikey-manager-qt
pkgver=1.2.2
pkgrel=1
pkgdesc='Cross-platform application for configuring any YubiKey over all USB transports'
arch=('x86_64')
url='https://developers.yubico.com/yubikey-manager-qt/'
license=('BSD')
depends=('yubikey-manager' 'qt5-quickcontrols' 'qt5-quickcontrols2' 'qt5-graphicaleffects' 'python-pyotherside')
replaces=('yubikey-neo-manager')
source=("https://developers.yubico.com/${pkgname}/Releases/${pkgname}-${pkgver}.tar.gz"{,.sig})
validpgpkeys=('8D0B4EBA9345254BCEC0E843514F078FF4AB24C3'  # Dag Heyman <dag@yubico.com>
	      '9E885C0302F9BB9167529C2D5CBA11E6ADC7BCD1') # Dennis Fokin <dennis.fokin@yubico.com> 
sha256sums=('14aa4ccb948d4bcce68e7916c34eea3cfa8b9304e4fed72dca022665cf5e11cb'
            'SKIP')

build() {
	cd ${pkgname}
	qmake-qt5
	make
}

package() {
	cd ${pkgname}
	make INSTALL_ROOT="${pkgdir}/" install
	install -D -m0644 resources/ykman-gui.desktop "${pkgdir}/usr/share/applications/ykman-gui.desktop"
	install -D -m0644 resources/icons/ykman.png "${pkgdir}/usr/share/pixmaps/ykman.png"
	install -D -m0644 debian/copyright "${pkgdir}/usr/share/licenses/${pkgname}/copyright"
}

