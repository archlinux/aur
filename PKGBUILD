# Maintainer: Inche Hwang <me at libhwang dot cc>
pkgname=vrc-avi-scaler
pkgver=0.4.0
pkgrel=1
pkgdesc="A tool to resize your avatar on VRChat."
arch=(any)
url="https://github.com/KutayX7/vrc-avi-scaler"
license=('MIT')
depends=('python>=3.12' 'python-osc' 'python-zeroconf')
makedepends=()
conflicts=("${pkgname}-git")
source=("$pkgname-$pkgver.tar.gz::https://github.com/KutayX7/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
	"launch-wrapper")
sha256sums=('ab3d14ff4b929cc1107cfc406b4f0998faa41de9d82cb47833727a24b4bd9cad'
            '5a7d249f42080fecf16e38321a008201ce8008a9139fa88cfa33982332453818')

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
	install -Dm644 command.py "${pkgdir}/usr/share/vrc-avi-scaler/command.py"
	install -Dm644 task.py "${pkgdir}/usr/share/vrc-avi-scaler/task.py"
	install -Dm644 translator.py "${pkgdir}/usr/share/vrc-avi-scaler/translator.py"

	cp -r translations "${pkgdir}/usr/share/vrc-avi-scaler"

	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"

	# Since upstream doesn't use standard installation methods, we're dropping a wrapper to launch vrc-avi-scaler.
	install -Dm755 ../launch-wrapper "${pkgdir}/usr/bin/vrc-avi-scaler"
}
