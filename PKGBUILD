# Maintainer: Nissar Chababy <funilrys at outlook dot com>
# Ex-Maintainer: Rob Lynn <rob22uk at gmail dot com>
# Contributor: Pablo Lezaeta <prflr88 (arro'a) gmail (puntocom)>

pkgname=firefox-mega
pkgver=3.5.5
pkgrel=1
groups=("firefox-addons")
pkgdesc="MEGA extension for Firefox; enables better support for mega.co.nz downloads"
arch=("any")
url="http://mega.co.nz"
license=("BSD")
groups=("firefox-addons")
source=("https://mega.nz/meganz.xpi")
sha512sums=('47757dd090c6163d54507a36558f989ec5b71dbaf87b63f2e04e776836d8d3aea43ce50a727f1816fa9193e9055b3b6bb155601b1acc7a3f90175ad8f7f58bf3')
package(){
	depends=("firefox")

	cd "${srcdir}"
	emid=$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf)
	local dstdir="${pkgdir}/usr/lib/firefox/browser/extensions/${emid}"
	install -d "${dstdir}"
	cp -dpr --no-preserve=ownership * "${dstdir}"
	rm -r "${dstdir}"/*.xpi
	find "${pkgdir}" -type d -exec chmod 0755 {} \;
	find "${pkgdir}" -type f -exec chmod 0644 {} \;
}
