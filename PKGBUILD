pkgname=batman-adv-dkms
pkgver=v2023.1
pkgrel=1
pkgdesc='batman kernel module (dkms package)'
arch=('any')
url='https://www.open-mesh.org/projects/batman-adv'
license=('GPL')
commit=840f089c1c680e19e4646599df41586a7f70c936
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
