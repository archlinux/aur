# Maintainer: j.r <j.r@jugendhacker.de>
pkgname=youplay
pkgver=0.41
pkgrel=1
pkgdesc="Search, download and play music from YouTube."
arch=(any)
url="https://codeberg.org/ralfhersel/youplay"
license=('GPL3')
depends=(mpv ffmpeg python-mpv yt-dlp python-gobject gtk4 libadwaita)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
	"0001-Change-paths-for-packaging.patch"
	"0002-Rename-Internet-catergorie-because-it-does-not-exist.patch")
md5sums=('6311fa2a1e718878f8a3ba28311a5738'
         '258d7a1e944d2289d5a3ffc859f4740f'
         '5b194ba6796bc971741a58535969ef98')

prepare() {
	cd "${pkgname}"	

	patch -p1 -i ${srcdir}/0001-Change-paths-for-packaging.patch
	patch -p1 -i ${srcdir}/0002-Rename-Internet-catergorie-because-it-does-not-exist.patch
}

package() {
	cd "${pkgname}"
	
	install -Dm755 youplay.sh ${pkgdir}/usr/bin/${pkgname}
	install -Dm755 youplay.py ${pkgdir}/usr/share/${pkgname}/${pkgname}.py
	install -Dm644 youplay.svg ${pkgdir}/usr/share/${pkgname}/${pkgname}.svg
	desktop-file-install --dir=${pkgdir}/usr/share/applications youplay.desktop
}
