# Maintainer: Jonathon Fernyhough <jonathon_at_manjaro_dot_org>

pkgname=ttf-soutane
_pkgname=soutane
pkgver=20150207
pkgrel=1
pkgdesc="Soutane TTF typeface"
arch=(any)
url="http://www.webpagefonts.com/"
license=(custom)
source=("http://www.webpagepublicity.com/free-fonts/s/Soutane%20Regular.ttf"
        "http://www.webpagepublicity.com/free-fonts/s/Soutane%20Bold.ttf"
		"http://www.webpagepublicity.com/free-fonts/s/Soutane%20Italic.ttf"
		"http://www.webpagepublicity.com/free-fonts/s/Soutane%20Bold%20Italic.ttf"
		"http://www.webpagepublicity.com/free-fonts/s/SoutaneBlack%20Regular.ttf")
sha256sums=('d28114931256495a45b96fc3a833bbba2169c84e7543a0d16367424e4b1faff3'
            'ec923856a2f5c88ea667d5ac0d7c90cd60ffce538efe39182e13abd96b2de613'
            '44dc858666f5df9d726869413ea34f0298b8eedf5dd125fc394a7e0e612293d8'
            '0a4de3907dbda0eb487e9152d03d9aa69c1915620f666bd33ae3a0c2b1f1ae92'
            'fc0f2e8c6ab17f510dcab260c2b8af041743646cb87689f155ff88222222ea38')

prepare() {
	cd "${srcdir}"
	mkdir out
	for font in *ttf; do
		mv -fv "${font}" out/"$(echo "${font}" | sed -e 's/%20/-/g' - )"
	done
	mv out/* ./
	rmdir out
}

package() {
	cd "${srcdir}"
	mkdir -p "${pkgdir}"/usr/share/fonts/${_pkgname}
	install -m644 ./*.ttf "${pkgdir}"/usr/share/fonts/${_pkgname}

	# TODO find license
	# install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
