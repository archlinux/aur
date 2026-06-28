# Maintainer: Inche Hwang <me at libhwang dot cc>
pkgname=vrc-avi-scaler
pkgver=0.3.0
pkgrel=1
pkgdesc="A tool to resize your avatar on VRChat."
arch=(any)
url="https://github.com/KutayX7/vrc-avi-scaler"
license=('MIT')
depends=('python>=3.12' 'python-osc' 'python-zeroconf')
makedepends=()
conflicts=("${pkgname}-git")
source=("$pkgname-$pkgver.tar.gz::https://github.com/KutayX7/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
	"0001-Use-XDG-spec-for-config-path.patch"
	"launch-wrapper")
sha256sums=('916f1614e3d8f331c86d643c9c71d225dafc9be62bd1ecb3c4b178d3d5eb8ed1'
            'eb42ad81c31f3c41ac603137b5ec41a8497a924ae43101f7421d312caad57a6f'
            '5a7d249f42080fecf16e38321a008201ce8008a9139fa88cfa33982332453818')
prepare() {
	cd "$pkgname-$pkgver"
	patch -Np1 -i ../0001-Use-XDG-spec-for-config-path.patch
}

package() {
	cd "$pkgname-$pkgver"

	install -Dm644 server.py "${pkgdir}/usr/share/vrc-avi-scaler/server.py"
	install -Dm644 oscquery.py "${pkgdir}/usr/share/vrc-avi-scaler/oscquery.py"
	install -Dm644 scaling_utils.py "${pkgdir}/usr/share/vrc-avi-scaler/scaling_utils.py"
	install -Dm644 compat.py "${pkgdir}/usr/share/vrc-avi-scaler/compat.py"
	install -Dm644 client.py "${pkgdir}/usr/share/vrc-avi-scaler/client.py"
	install -Dm644 globals.py "${pkgdir}/usr/share/vrc-avi-scaler/globals.py"
	install -Dm644 simple_types.py "${pkgdir}/usr/share/vrc-avi-scaler/simple_types.py"
	install -Dm644 main.py "${pkgdir}/usr/share/vrc-avi-scaler/main.py"
	install -Dm644 config.py "${pkgdir}/usr/share/vrc-avi-scaler/config.py"

	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"

	# Since upstream doesn't use standard installation methods, we're dropping a wrapper to launch vrc-avi-scaler.
	install -Dm755 ../launch-wrapper "${pkgdir}/usr/bin/vrc-avi-scaler"
}
