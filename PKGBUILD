#! /bin/bash

pkgname="ttf-google-fonts"
pkgdesc="All fonts available in Google products"
url="https://github.com/google/fonts"
license=("Apache" "custom:SIL Open Font License 1.1" "custom:Ubuntu Font License 1.0")

pkgver=2019.08
pkgrel=1
arch=("any")
source=(git+"${url}".git)
sha512sums=("SKIP")

provides=("${pkgname}")
conflicts=("${provides}")
makedepends=("git")
depends=(
	"fontconfig"
	"noto-fonts-emoji"
	"xorg-fonts-encodings"
	"xorg-mkfontdir"
	"xorg-mkfontscale")


pkgver () {
	cd "fonts"
	git log -1 --format="%cd" --date="short" | sed 's|-|.|g' | cut --delimiter='.' --fields=1,2
}


build () {
	cd "${srcdir}/fonts"
	find -maxdepth 1 -type f -delete
	rm --recursive --force .[!.]*
	rm --recursive "./ofl/adobeblank"
}


package () {
	FontsDir="${pkgdir}/usr/share/fonts"
	install --directory "${FontsDir}"
	mv "${srcdir}/fonts" "${FontsDir}/google"
}

