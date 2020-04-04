# Maintainer: katt <magunasu.b97@gmail.com>

_pkgname=ksysguard-gpu
pkgname=$_pkgname-git
pkgver=0.3.r7.g2099048
pkgrel=1
pkgdesc="gpu visualization for ksysguard"
arch=(any)
url="https://github.com/lestofante/ksysguard-gpu"
license=('GPL3')
depends=('python')
optdepends=('ksysguard: For connecting to script as intended'
			'radeontop: AMD card support'
			'intel-gpu-tools: Intel card support'
			'nvidia-utils: NVIDIA card support')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url")
md5sums=(SKIP)

pkgver() {
	cd "$_pkgname"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	install -Dm644 "${srcdir}/$_pkgname/systemd-unit/ksysguard-gpu.service" "${pkgdir}/usr/lib/systemd/system/ksysguard-gpu.service"
	install -Dm755 "${srcdir}/$_pkgname/src/ksysguard-gpu.py" "${pkgdir}/usr/bin/ksysguard-gpu.py"
}