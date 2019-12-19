pkgname=batman-adv-dkms
pkgver=v2019.5
pkgrel=1
pkgdesc='batman kernel module (dkms package)'
arch=('any')
url='https://www.open-mesh.org/projects/batman-adv'
license=('GPL')
commit=be3500eaa01b682155ae65722e536801847e836f
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
