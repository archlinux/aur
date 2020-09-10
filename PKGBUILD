# Maintainer: katt <magunasu.b97@gmail.com>
# Contributor: Dan McCurry <dan.mccurry at linux dot com>
# Contributor: André Fettouhi <a.fettouhi@gmail.com>

pkgname=gog-beneath-a-steel-sky
pkgver=0.0372
epoch=1
pkgrel=2
pkgdesc='All man'\''s social problems are coming to a boil. Under the claustrophobic lid of a steel sky.'
arch=(any)
url=https://www.gog.com/game/beneath_a_steel_sky
license=(custom:commercial)
depends=(scummvm)
source=(local://beneath_a_steel_sky_en_gog_2_20150.sh
		"${pkgname#gog-}")
sha256sums=('d30476a34bb4bd99c68d130780c9e2db9727c157b8123f13447ed755724efdc5'
            '606428aa493cf3162c54db7b79c6deb9c0825aee398cf24255c5b09002262dc2')

prepare() {
	sed -i data/noarch/beneath.ini \
		-e "s|^path.*|path=/usr/share/${pkgname#gog-}|g" \
		-e "/^savepath.*/d"
}

package() {
	install -Dm644 -t "${pkgdir}/usr/share/${pkgname#gog-}" data/noarch/data/{SKY.CFG,sky.cpt,sky.dnr,sky.dsk}
	install -m644 data/noarch/beneath.ini "${pkgdir}/usr/share/${pkgname#gog-}/config.ini"
	install -Dm755 -t "${pkgdir}/usr/bin" "${pkgname#gog-}"

#	Launching via .desktop file just hangs, I give up. 
#	install -Dm644 -t "$pkgdir/usr/share/applications" "${pkgname#gog-}.desktop"
#	install -Dm644 data/noarch/support/icon.png "${pkgdir}/usr/share/pixmaps/${pkgname#gog-}.png" 

	install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname#gog-}" data/noarch/docs/{manual.pdf,walkthrough.pdf} data/noarch/data/readme.txt
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "data/noarch/docs/End User License Agreement.txt"
}
