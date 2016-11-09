# $Id: $
# Maintainer: Pablo Lezaeta <prflr88@gmail.com>

pkgname=firefox-tumblr-savior
pkgver=0.5.0
pkgrel=1
_dnum=388913
groups=("firefox-addons")
pkgdesc="Extension for firefox which block post with predefined tags in Tumblr"
arch=("any")
url="http://bjornstar.com/tumblr-savior"
license=("MIT")
source=("https://addons.cdn.mozilla.net/user-media/addons/${_dnum}/tumblr_savior-${pkgver}-an+fx.xpi")

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

md5sums=('6e85a7242108a0ffd809234d8eea519a')
