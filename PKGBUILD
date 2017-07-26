pkgname=batman-adv-dkms
pkgver=v2017.1
pkgrel=2
pkgdesc='batman kernel module (dkms package)'
arch=('any')
url='https://www.open-mesh.org/projects/batman-adv'
license=('GPL')
source=(
	"batman-adv::git+https://git.open-mesh.org/batman-adv.git#commit=33cc78db4852ee8d07f2c21dca9f297dd3b2ccef"
	'dkms.conf'
)
sha256sums=('SKIP'
            'af072d643fb0587c8a5af4c7faf0d9a9cb73f3515a3b79853c60d98a30743ab2')
depends=('dkms')

package() {
	install -dm755 "${pkgdir}/usr/src/${pkgbase}-${pkgver}/"

	cp -r "${srcdir}"/batman-adv/* "${pkgdir}/usr/src/${pkgbase}-${pkgver}/"

	install -Dm644 "${srcdir}/dkms.conf" "${pkgdir}/usr/src/${pkgbase}-${pkgver}/"
	sed -i "s/#MODULE_VERSION#/${pkgver}/" "${pkgdir}/usr/src/${pkgbase}-${pkgver}/dkms.conf"
}
