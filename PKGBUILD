# Maintainer: Martin Rys <rys.pw/contact>
# Previous maintainers:
#   Shayne Hartford<shayneehartford@gmail.com>
pkgname=nvflash
pkgver=5.814
pkgrel=2
pkgdesc="A tool to update the the firmware of Nvidia display adapters."
url="https://www.techpowerup.com/download/nvidia-nvflash/"
arch=('x86_64' 'i686' 'aarch64')
license=('unknown')
makedepends=('wget' 'unzip')
DLAGENTS=("https::/usr/bin/wget --method POST --header 'content-type:\ application/x-www-form-urlencoded' --body-data id=2271&server_id=8 -O %o %u")
source=("${pkgname}-${pkgver}.zip::https://www.techpowerup.com/download/nvidia-nvflash/")
sha256sums=('989c17bba1393bdcf4971cfae713ead8629fda4e1db37272d8e98575a85c3c68')

#prepare() {
#	wget \
#		--method POST \
#		--header 'content-type: application/x-www-form-urlencoded' \
#		--body-data 'id=2271&server_id=8' \
#		--output-document="${pkgname}-${pkgver}.zip" \
#		"${url}"

## Would be nice to get rid of the wget dependency, but I can't figure it out, here's one of my attempts -
##	curl -X POST -L --post301 --post302 \
##		-H 'Content-Type: application/x-www-form-urlencoded' \
##		-H 'User-Agent: Wget/1.21.4' \
##		-d 'id=2271&server_id=8' \
##		-o "${pkgname}-${pkgver}.zip" \
##		"${url}"

#	unzip -o "${pkgname}-${pkgver}.zip"
#}

package() {
	subd=$(echo "${arch}" | sed -e 's/x86_64/x64/' -e 's/i686/x32/')
	install -Dm755 "${srcdir}/${subd}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
