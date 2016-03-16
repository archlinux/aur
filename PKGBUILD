# $Id: $
# Maintainer: Pablo Lezaeta <prflr88@gmail.com>

pkgname=firefox-tumblr-savior
pkgver=0.4.25
pkgrel=1
_dnum=411031
groups=("firefox-addons")
pkgdesc="Extension for firefox which block post with predefined tags in Tumblr"
arch=("any")
url="http://bjornstar.com/tumblr-savior"
license=("MIT")
source=("https://addons.mozilla.org/firefox/downloads/file/${_dnum}/tumblr_savior-${pkgver}-fx.xpi")

package() {
	depends=("firefox")

	cd "${srcdir}"
	emid=$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf)
	local dstdir="${pkgdir}/usr/lib/firefox/browser/extensions/${emid}"
	install -d "${dstdir}"
	cp -dprv --no-preserve=ownership * "${dstdir}"
	rm -rv "${dstdir}"/*.xpi
	find "${pkgdir}" -type d -exec chmod 0755 {} \;
	find "${pkgdir}" -type f -exec chmod 0644 {} \;
}

md5sums=('ac8c4b25be631e6ef20e071a22354cec')
