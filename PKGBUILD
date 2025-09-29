# Maintainer: BTD Master <btdmaster at disroot dot org>
pkgname=syphon-bin
_pkgname=syphon
pkgver=0.2.14
pkgrel=3
pkgdesc="Privacy-centric Matrix client"
arch=('x86_64' 'aarch64')
url="https://github.com/syphon-org/syphon"
license=('AGPL3')
depends=('gtk3' 'libsecret' 'libolm' 'jsoncpp' 'sqlcipher')
provides=('syphon=${pkgver}')
conflicts=('syphon')
source_aarch64=("https://github.com/syphon-org/syphon/releases/download/$pkgver/$_pkgname.linux.$pkgver.arm64.tar.gz")
source_x86_64=("https://github.com/syphon-org/syphon/releases/download/$pkgver/$_pkgname.linux.$pkgver.x64.tar.gz")
sha256sums_aarch64=('7fb88a7ebf99f2df80f5ed2ba32bdc228e2d76bf532fee40e23eb1982b9d4d0c')
sha256sums_x86_64=('dd31f0516bfccd8460c7bb4db33f24ffb6258a7817b0624dc35d8c0abb1023c6')

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
