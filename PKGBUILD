pkgname=batman-adv-dkms-git
pkgver=v2018.3.10.g6f6cc4f5
pkgrel=1
pkgdesc='batman kernel module (dkms package)'
arch=('any')
provides=('batman-adv')
conflicts=('batman-adv-dkms')
url='https://www.open-mesh.org/projects/batman-adv'
license=('GPL')
source=(
	"batman-adv::git+https://git.open-mesh.org/batman-adv.git#branch=master"
	'dkms.conf'
)
sha256sums=('SKIP'
            'af072d643fb0587c8a5af4c7faf0d9a9cb73f3515a3b79853c60d98a30743ab2')
depends=('dkms')

pkgver() {
	cd "${srcdir}/batman-adv"
	git describe --tags | sed 's/-/./g'
}

package() {
	install -dm755 "${pkgdir}/usr/src/${pkgbase}-${pkgver}/"

	cp -r "${srcdir}"/batman-adv/* "${pkgdir}/usr/src/${pkgbase}-${pkgver}/"

	install -Dm644 "${srcdir}/dkms.conf" "${pkgdir}/usr/src/${pkgbase}-${pkgver}/"
	sed -i "s/#MODULE_VERSION#/${pkgver}/" "${pkgdir}/usr/src/${pkgbase}-${pkgver}/dkms.conf"
}
