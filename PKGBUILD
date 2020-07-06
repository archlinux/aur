pkgname=batman-adv-dkms
pkgver=v2020.2
pkgrel=1
pkgdesc='batman kernel module (dkms package)'
arch=('any')
url='https://www.open-mesh.org/projects/batman-adv'
license=('GPL')
commit=ba4f6189f7c89689387396651d5f04e098c77f82
source=(
	"batman-adv::git+https://git.open-mesh.org/batman-adv.git#commit=${commit}"
	'dkms.conf'
)
sha256sums=('SKIP'
            'c37a0d2985e50586225e92698aeade10c3756bd31d1098d495ceff55f165487a')
depends=('dkms')

package() {
	install -dm755 "${pkgdir}/usr/src/${pkgbase}-${pkgver}/"

	cp -r "${srcdir}"/batman-adv/* "${pkgdir}/usr/src/${pkgbase}-${pkgver}/"

	install -Dm644 "${srcdir}/dkms.conf" "${pkgdir}/usr/src/${pkgbase}-${pkgver}/"
	sed -i "s/#MODULE_VERSION#/${pkgver}/" "${pkgdir}/usr/src/${pkgbase}-${pkgver}/dkms.conf"
}
