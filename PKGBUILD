# Maintainer: BTD Master <btdmaster at disroot dot org>
pkgname=syphon-bin
_pkgname=syphon
pkgver=0.2.13
pkgrel=1
pkgdesc="Privacy-centric Matrix client"
arch=('x86_64')
url="https://github.com/syphon-org/syphon"
license=('AGPL3')
depends=('gtk3' 'libsecret' 'libolm' 'jsoncpp' 'sqlcipher')
provides=('syphon')
source=("https://github.com/syphon-org/syphon/releases/download/$pkgver/$_pkgname.linux.x64.$pkgver.tar.gz")
sha256sums=('8fde727a4826412c48f7930444529bda2deb6b1899b59e61b1fa8b722b60d5a1')

package() {
	install -d ${pkgdir}/opt/${_pkgname}
	install -d ${pkgdir}/usr/{bin,lib,share}
	install -d ${pkgdir}/usr/share/{pixmaps,applications}
	cp -r ${srcdir}/{data,lib,syphon} ${pkgdir}/opt/${_pkgname}
	cp ${srcdir}/lib/libflutter* ${pkgdir}/usr/lib/
	cp ${srcdir}/lib/liburl* ${pkgdir}/usr/lib/
	cp ${srcdir}/data/flutter_assets/assets/icons/current/app_icon_cyan.png ${pkgdir}/usr/share/pixmaps/syphon.png
	install -Dm644 /dev/stdin ${pkgdir}/usr/share/applications/${_pkgname}.desktop << END
[Desktop Entry]
Name=Syphon
Type=Application
Comment=Privacy-focused Matrix client
Exec=syphon
Icon=syphon
END
	ln -s /usr/lib/libjsoncpp.so.25 ${pkgdir}/usr/lib/libjsoncpp.so.1
	ln -s /opt/${_pkgname}/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
}
