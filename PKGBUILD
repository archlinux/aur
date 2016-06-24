# Maintainer: Jamie Tanna <jamie@jamietanna.co.uk>
_pkgname=youtube-mpv
pkgname=${_pkgname}-git
pkgver=44
pkgrel=1
pkgdesc="Browser extension that adds context menu option to play youtube (and other youtube-dl supported) videos with mpv."
arch=('any')
url="https://github.com/agiz/youtube-mpv"
license=('GPL2')
depends=('youtube-dl' 'python')
makedepends=()
# TODO store config per user?
source=("git+https://github.com/agiz/youtube-mpv"
		"youtube-mpv@.service"
		"youtube-mpv.service")
noextract=()
md5sums=('SKIP'
         'a4d0fad3b31b5ed17bb58e90af2f7d14'
         '8c7883fb1ac0dd4376cbaf0ee46848e3')

pkgver() {
	cd "$srcdir/$_pkgname"
	git rev-list --count HEAD
}

package() {
	install -D -m644 "$_pkgname/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -D -m644 "youtube-mpv.service" "${pkgdir}/usr/lib/systemd/user/youtube-mpv.service"
	install -D -m644 "youtube-mpv@.service" "${pkgdir}/usr/lib/systemd/system/youtube-mpv@.service"

	install -D -m644 "$_pkgname/ytdl_config.py" "${pkgdir}/opt/${pkgname}/ytdl_config.py"
	install -D -m755 "$_pkgname/ytdl_server.py" "${pkgdir}/opt/${pkgname}/ytdl_server.py"

	mkdir -p "${pkgdir}/opt/extensions/"
	cp -a "$_pkgname/chrome" "${pkgdir}/opt/${pkgname}/extensions/"
	cp -a "$_pkgname/firefox" "${pkgdir}/opt/${pkgname}/extensions/"
}
