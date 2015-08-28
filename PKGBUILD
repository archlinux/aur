# Maintainer: Sergey Kostyuk <ks.hot.ua@gmail.com>

pkgname=infinit
pkgver=0.9.39
pkgrel=1
pkgdesc="Send files and folders of any size or format."
arch=('x86_64')
url="https://infinit.io/"
license=('custom:infinit')
options=(!strip)
source=("${pkgname}.desktop"
		"terms-and-conditions.html::https://infinit.io/legal"
		"${pkgname}.png::https://infinit.io/images/press/logos/logo.png")
source_x86_64=("https://infinit.io/downloads/${pkgname}_${pkgver}_amd64.deb")
md5sums=('4b285f98f30716e3abb3876ec7a43de9'
		 'SKIP'
		 '6ad5976c6f29f5202f44144206c0249b')
md5sums_x86_64=('9cf29795e5a6509df0c57b92085a069b')

package() {
	# Unpack nested archieve
	tar xzf data.tar.gz -C "${pkgdir}/"

	# Link binary
	install -d "$pkgdir"/usr/bin
	ln -s ../../opt/infinit/bin/Infinit "$pkgdir"/usr/bin/Infinit

	# Copy additional files
	install -Dm644 "terms-and-conditions.html" \
		"${pkgdir}/usr/share/licenses/${pkgname}/terms-and-conditions.html"

	install -Dm644 "${pkgname}.desktop" \
		"${pkgdir}/usr/share/applications/${pkgname}.desktop"

	install -Dm644 "${pkgname}.png" \
		"${pkgdir}/usr/share/pixmaps/infinit.png"

}
