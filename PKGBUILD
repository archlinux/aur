# Maintainer : André Fettouhi <a.fettouhi@gmail.com>
# Contributor : Dan McCurry <dan.mccurry at linux dot com>

pkgname=gog-rise-of-the-triad-dark-war
pkgver=2.0.0.8
pkgrel=1
pkgdesc="Old-school first person shooter with an arcade feel."
arch=("i686" "x86_64")
url="http://www.gog.com/game/rise_of_the_triad__dark_war"
license=("custom")
groups=("games")
source=("local://gog_rise_of_the_triad_dark_war_${pkgver}.sh"
	"local://${pkgname}")
sha256sums=('673c519bb35aefd69360ba989ee79faa1ae896e4655c3f96cb26a03f2562ec61'
            'd74bb4ed35d23c4a788fca6cf14d4eb21a0a39e7e25cbc6d943fe1658bd7c343')
depends=('libpng12' 'unionfs-fuse')
makedepends=('gendesk')

# Trim gog- prefix from launcher
_appname=$(echo ${pkgname} | sed -n 's/gog-//p')

prepare() {
	# Create menu icons
	gendesk -n --pkgname "$pkgname" \
		--pkgdesc "$pkgdesc" \
		--name='ROTT Dark War' \
		--exec="/usr/bin/${_appname}" \
		--categories "Application;Game;ActionGame;"
}

package() {
	mkdir -p "${pkgdir}"/opt/gog/${_appname}
	cp -r "${srcdir}"/data/noarch/* "${pkgdir}/opt/gog/${_appname}/"
	install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -Dm644 "${srcdir}/data/noarch/support/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
	install -Dm644 "${srcdir}/data/noarch/docs/End User License Agreement.txt" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
	install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${_appname}"
}
 
