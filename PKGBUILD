# Maintainer: Stick <stick@stma.is>
# Maintainer: MountainX

pkgname=atkinson-hyperlegible-fonts
pkgver=1.02
pkgrel=1
pkgdesc='Font that is easier to read across the entire visual-ability spectrum. Focuses on letterform distinction.'
url='https://www.brailleinstitute.org/freefont'
arch=('any')
license=('custom')
source=('https://www.brailleinstitute.org/wp-content/uploads/atkinson-hyperlegible-font/Atkinson-Hyperlegible-Font-Print-and-Web-2020-0514.zip'
	'LICENSE')
sha256sums=('9e1a65d53ddadc8253791e958a07bf5aba210ef6155ea9c91b2b4c46bbce53e3'
	'e16e151abad1cd5f7dfaddf0b3309ba98c93daa8a7dce9d53505c4b0e5c6a1b6')

package() {
	mkdir -p "$pkgdir"/usr/share/{fonts/{TTF,OTF},licenses/"$pkgname"}
	install -D -m0644 "$srcdir"/LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/

	for _dir in 'Print Fonts' 'Web Fonts/TTF'; do
		cd "$srcdir/Atkinson-Hyperlegible-Font-Print-and-Web-2020-0514/$_dir" || exit
		for _font in *.?tf; do
			_EXT="${_font##*.}"
			install -m 644 "$_font" "$pkgdir"/usr/share/fonts/"${_EXT^^}"/"${_font/-${pkgver/./}/}"
		done
	done
}
