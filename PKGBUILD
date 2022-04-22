# Maintainer: Stezko <stezko@gmail.com>
pkgname=gnome-connection-manager-bin
pkgver=1.2.1
pkgrel=7
pkgdesc="Simple tabbed ssh and telnet connection manager for GTK+ environments."
arch=('any')
url="http://kuthulu.com/gcm"
license=('GPL3')
depends=('expect' 'python' 'python-gobject')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=(
		"https://github.com/kuthulux/gnome-connection-manager/releases/download/v${pkgver}/gnome-connection-manager_${pkgver}_all.deb"
		"https://raw.githubusercontent.com/kuthulux/gnome-connection-manager/d2f66e3d668245f549ff6a69f662b1ebd669dc51/style.css"
		)
sha256sums=(
			'bb6cc57aeddb1b4c42904b61a2c8db1b1f3d68b2bf1627e05944c0931ad78a4f'
			'SKIP')

package(){
	bsdtar xzf data.tar.gz -C "${pkgdir}"

	install -d "${pkgdir}/usr/share/pixmaps"
	ln -s "/usr/share/${pkgname%-bin}/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"

	sed -i "s|Icon=/usr/share/${pkgname%-bin}/icon.png|Icon=${pkgname%-bin}|g" \
    "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"

	install -D -m644 ${pkgdir}/usr/share/doc/${pkgname%-bin}/copyright "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE"

	# fix folder permissions
	find "${pkgdir}" -type d -print0 |xargs -0 chmod 755

	# fix css error
	install -D -m755 ${srcdir}/style.css "${pkgdir}/usr/share/${pkgname%-bin}/style.css"
}
