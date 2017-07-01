# Maintainer: Jonathon Fernyhough <jonathon_at_manjaro_dot_org>

pkgname=ttf-fritz
_pkgname=fritz
pkgver=20150207
pkgrel=1
pkgdesc="Fritz TTF typeface"
arch=(any)
url="http://www.webpagefonts.com/"
license=(custom)
source=("http://www.webpagepublicity.com/free-fonts/f/Fritz%20Regular.ttf"
        "http://www.webpagepublicity.com/free-fonts/f/Fritz%20Bold.ttf"
		"http://www.webpagepublicity.com/free-fonts/f/Fritz-Quad.ttf")
sha256sums=('6eee8ff4f43262be46e2e44928ce23e54716ab8ec7c8ed3458f193a40334ede1'
            '8f001c0e2db4f441ea8af55f9c54e2d4386fc8ea758014cd91cebea651aa7cc0'
            'd89f7dec62cef1cb9fa85fb8013afc5aa150d554cf48a1fe2e39938ee794750c')

prepare() {
	cd "${srcdir}"
	mkdir out
	msg2 "Renaming files..."
	for font in *ttf; do
		mv -v "${font}" out/"$(echo "${font}" | sed -e 's/%20/-/g' - )"
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
