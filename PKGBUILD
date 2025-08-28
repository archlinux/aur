# Maintainer: Martin Rys <https://rys.rs/contact>
# Contributor: Jonatan Holmgren <jonatan at jontes dot page>
# Contributor: Shayne Hartford<shayneehartford@gmail.com>
pkgname=nvflash
pkgver=5.867
pkgrel=3
pkgdesc="A tool to update the the firmware of Nvidia display adapters"
url="https://www.techpowerup.com/download/nvidia-nvflash/"
arch=('x86_64' 'i686' 'aarch64')
license=('unknown')
depends=('glibc' 'gcc-libs')
makedepends=('curl' 'unzip')
# id == filename
# server_id == server to download from
DLAGENTS=(
	#"https::/usr/bin/wget --method POST --header 'content-type:\ application/x-www-form-urlencoded' --body-data id=2807&server_id=14 -O %o %u"
	"https::/usr/bin/curl -L -A 'NVFlash\ AUR\ Package\ Builder\ ${pkgver}-${pkgrel}' -e %u --header 'Content-Type:\ application/x-www-form-urlencoded' --data-raw id=2807&server_id=14 -o %o %u"
)
source=("${pkgname}-${pkgver}.zip::https://www.techpowerup.com/download/nvidia-nvflash/")
sha256sums=('73ab51e121129059f1377b3bf21a8001f6649d64af2471455499c803a9c80301')

package() {
	subd=$(echo "${arch}" | sed -e 's/x86_64/x64/' -e 's/i686/x32/')
	install -Dm755 "${srcdir}/${subd}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
