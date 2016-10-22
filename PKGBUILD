pkgname=batman-adv-legacy-dkms
pkgver=20160614
pkgrel=1
pkgdesc='batman kernel module (legacy version based on compat 14, dkms package)'
arch=('any')
url='https://github.com/freifunk-gluon/batman-adv-legacy/'
license=('GPL')
source=(
	'batman-adv-legacy::git+https://github.com/freifunk-gluon/batman-adv-legacy.git#commit=a570bc616990cce80c41394a2c02e3a15dd38de3'
	'dkms.conf'
)
sha256sums=('SKIP' 'a0344811e0dc4954c688e8a1df84542c59709cd9349b5cb0dad38c35e5d773a6')
depends=('dkms')

package() {
	install -dm755 "${pkgdir}/usr/src/${pkgbase}-${pkgver}/"

	cp -r "${srcdir}"/batman-adv-legacy/* "${pkgdir}/usr/src/${pkgbase}-${pkgver}/"

	install -Dm644 "${srcdir}/dkms.conf" "${pkgdir}/usr/src/${pkgbase}-${pkgver}/"
	sed -i "s/#MODULE_VERSION#/${pkgver}/" "${pkgdir}/usr/src/${pkgbase}-${pkgver}/dkms.conf"
}
