# Maintainer: katt <magunasu.b97@gmail.com>

pkgname=ksysguard-gpu-git
pkgver=0.5.r1.g53dc730
pkgrel=1
pkgdesc='gpu visualization for ksysguard'
arch=(any)
url='https://github.com/lestofante/ksysguard-gpu'
license=(GPL3)
depends=(python)
makedepends=(git)
optdepends=('ksysguard: For connecting to script as intended'
			'radeontop: AMD card support'
			'intel-gpu-tools: Intel card support'
			'nvidia-utils: NVIDIA card support')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+"${url}".git)
md5sums=(SKIP)

pkgver() {
	cd "${pkgname%-git}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	install -Dm644 "${pkgname%-git}/systemd-unit/ksysguard-gpu.service" -t "${pkgdir}/usr/lib/systemd/system"
	install -Dm755 "${pkgname%-git}/src/ksysguard-gpu.py" -t "${pkgdir}/usr/bin"
}
