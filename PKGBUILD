# Maintainer: Nissar Chababy <funilrys at outlook dot com>
# Ex-Maintainer: Rob Lynn <rob22uk at gmail dot com>
# Contributor: Pablo Lezaeta <prflr88 (arro'a) gmail (puntocom)>

pkgname=firefox-mega
pkgver=3.7.31
pkgrel=1
groups=("firefox-addons")
pkgdesc="MEGA extension for Firefox; enables better support for mega.co.nz downloads"
arch=("any")
url="http://mega.co.nz"
license=("BSD")
groups=("firefox-addons")
source=("https://mega.nz/meganz.xpi")
sha512sums=('a8a0bd88be7ad572e781a79646daeb6d426ae59490460011a22a325ec7b37912b9e1cbfa59fd17d65d9dadc5f4986d74e01872c399a5b346225d91b01e5259a2')
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
