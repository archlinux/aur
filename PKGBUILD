# Maintainer: Stezko <stezko@gmail.com>
pkgname=gnome-connection-manager-bin
pkgver=1.2.1
pkgrel=5
pkgdesc="Simple tabbed ssh and telnet connection manager for GTK+ environments."
arch=('any')
url="http://kuthulu.com/gcm"
license=('GPLv3')
groups=('')
depends=('expect' 'python' 'python-gobject')
options=('!strip' '!emptydirs')
source=(
		"https://github.com/kuthulux/gnome-connection-manager/releases/download/v${pkgver}/gnome-connection-manager_${pkgver}_all.deb"
		"https://raw.githubusercontent.com/kuthulux/gnome-connection-manager/d2f66e3d668245f549ff6a69f662b1ebd669dc51/style.css"
		)
sha512sums=(
			'0487cafda21d2a277ae2bf234a4d758c710e35b75eae2fffdef1d01ae19046bef0de13f4cde05c23f7d03d847a5548fb4ad5e0ae554a13f32a057d93feac8610'
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
