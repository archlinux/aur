# Maintainer: Nissar Chababy <funilrys at outlook dot com>
# Ex-Maintainer: Rob Lynn <rob22uk at gmail dot com>
# Contributor: Pablo Lezaeta <prflr88 (arro'a) gmail (puntocom)>

pkgname=firefox-mega
pkgver=3.6.2
pkgrel=1
groups=("firefox-addons")
pkgdesc="MEGA extension for Firefox; enables better support for mega.co.nz downloads"
arch=("any")
url="http://mega.co.nz"
license=("BSD")
groups=("firefox-addons")
source=("https://mega.nz/meganz.xpi")
sha512sums=('0d89a68a283b5a66804dff2fad384e0849420fd7d1b0b217fe4d8efa198bf018a071a9a371ae94666e93f4c88e23c0b32a461bac65df8da4fa071b7a1f7a0023')
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
