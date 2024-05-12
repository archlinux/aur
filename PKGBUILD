# Maintainer: Integral <integral@member.fsf.org>

pkgname=maxhub-share-uos
pkgver=3.12.77.6
pkgrel=1
pkgdesc="MAXHUB 传屏助手 A wireless screen sharing software."
arch=('x86_64')
url="https://www.maxhub.com/share/"
license=('custom')
depends=('qt5-tools' 'qt5-xmlpatterns' 'libspeechd' 'qt5-sensors' 'qt5-webengine' 'qt5-svg' 'ffmpeg4.4' 'gtk3' 'qt5-speech' 'qt5-quickcontrols2' 'qt5-wayland')
source=(
	"https://home-store-packages.uniontech.com/appstore/pool/appstore/c/com.cvte.maxhub.share/com.cvte.maxhub.share_${pkgver}_amd64.deb"
)
sha512sums=('bfd95972fece4a9f43d88bf15c370be86e26a02255055cfa0900cad685658dd1b9d09be2703ba1ae01868303b2b7a57add96c8b5b78786eaf1579e1338fe205e')

package() {
	echo "  -> Extracting the data.tar.xz..."
	bsdtar -xvf data.tar.xz -C "${pkgdir}/"
	chmod -R 755 "${pkgdir}/"

	echo "  -> Installing..."
	# Launcher
	mkdir -p "${pkgdir}/usr/bin/"
	ln -s "/opt/apps/com.cvte.maxhub.share/files/bin/MAXHUBShare" "${pkgdir}/usr/bin/${pkgname}"
	# Desktop Entry
	install -Dm644 "${pkgdir}/opt/apps/com.cvte.maxhub.share/entries/applications/com.cvte.maxhub.share.desktop" -t "${pkgdir}/usr/share/applications/"
	# Icon
	cp -r "${pkgdir}/opt/apps/com.cvte.maxhub.share/entries/icons" "${pkgdir}/usr/share/"
	chmod -R 755 "${pkgdir}/usr/share/icons"
}
