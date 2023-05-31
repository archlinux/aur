# Maintainer: j.r <j.r@jugendhacker.de>
pkgname=youplay
pkgver=0.45
pkgrel=1
pkgdesc="Search, download and play music from YouTube."
arch=(any)
url="https://codeberg.org/ralfhersel/youplay"
license=('GPL3')
depends=(mpv ffmpeg python-mpv yt-dlp python-gobject gtk4 libadwaita)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
	"0001-Change-paths-for-packaging.patch")
md5sums=('d604047baf16fd568fc244f903383524'
         '55007368916e87260b24c6c9668804b5')

prepare() {
	cd "${pkgname}"	

	patch -p1 -i ${srcdir}/0001-Change-paths-for-packaging.patch
}

package() {
	cd "${pkgname}"
	
	install -Dm755 youplay.sh ${pkgdir}/usr/bin/${pkgname}
	install -Dm755 youplay.py ${pkgdir}/usr/share/${pkgname}/${pkgname}.py
	install -Dm644 youplay.svg ${pkgdir}/usr/share/${pkgname}/${pkgname}.svg
	desktop-file-install --dir=${pkgdir}/usr/share/applications youplay.desktop
}
